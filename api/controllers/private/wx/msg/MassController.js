/**
 * Created by wizzer on 2016/5/6.
 */
var moment = require('moment');
var emoji = require('emoji');
var StringUtil = require('../../../../common/StringUtil');
var fs = require('fs-extra');
module.exports = {
  index: function (req, res) {
    var wxid = req.params.id || '';
    Wx_config.find({select: ['id', 'appname']}).exec(function (err, list) {
      req.data.wxlist = list;
      if (!wxid && list && list.length > 0) {
        wxid = list[0].id;
      }
      req.data.wxid = wxid;
      return res.view('private/wx/msg/mass/index', req.data);
    });
  },
  data: function (req, res) {
    var pageSize = parseInt(req.body.length);
    var start = parseInt(req.body.start);
    var page = start / pageSize + 1;
    var draw = parseInt(req.body.draw);
    var order = req.body.order || [];
    var wxid = req.body.wxid;
    var nickname = req.body.nickname;
    var content = req.body.content;
    var columns = req.body.columns || [];
    var sort = {};
    var where = {};
    if (wxid) {
      where.wxid = wxid;
    }
    if (nickname) {
      where.nickname = {'like': '%' + nickname + '%'};
    }
    if (content) {
      where.content = {'like': '%' + content + '%'};
    }
    if (order.length > 0) {
      sort[columns[order[0].column].data] = order[0].dir;
    }
    Wx_msg.count(where).exec(function (err, count) {
      if (!err && count > 0) {
        Wx_msg.find(where)
          .sort(sort)
          .paginate({page: page, limit: pageSize})
          .exec(function (err, list) {
            return res.json({
              "draw": draw,
              "recordsTotal": pageSize,
              "recordsFiltered": count,
              "data": list
            });
          });
      } else {
        return res.json({
          "draw": draw,
          "recordsTotal": pageSize,
          "recordsFiltered": 0,
          "data": []
        });
      }
    });
  },
  news: function (req, res) {
    req.data.wxid = req.params.id || '';
    return res.view('private/wx/msg/mass/news', req.data);
  },
  newsData: function (req, res) {
    var pageSize = parseInt(req.body.length);
    var start = parseInt(req.body.start);
    var page = start / pageSize + 1;
    var draw = parseInt(req.body.draw);
    var order = req.body.order || [];
    var wxid = req.body.wxid;
    var columns = req.body.columns || [];
    var sort = {};
    var where = {};
    if (wxid) {
      where.wxid = wxid;
    }
    if (order.length > 0) {
      sort[columns[order[0].column].data] = order[0].dir;
    }
    Wx_mass_news.count(where).exec(function (err, count) {
      if (!err && count > 0) {
        Wx_mass_news.find(where)
          .sort(sort)
          .paginate({page: page, limit: pageSize})
          .exec(function (err, list) {
            return res.json({
              "draw": draw,
              "recordsTotal": pageSize,
              "recordsFiltered": count,
              "data": list
            });
          });
      } else {
        return res.json({
          "draw": draw,
          "recordsTotal": pageSize,
          "recordsFiltered": 0,
          "data": []
        });
      }
    });
  },
  addNews: function (req, res) {
    req.data.wxid = req.params.id || '';
    return res.view('private/wx/msg/mass/add', req.data);
  },
  uploadThumb: function (req, res) {
    var wxid = req.params.id || '';
    req.file('Filedata').upload({
      maxBytes: 2048000
    }, function (err, uploadedFiles) {
      if (err) {
        return res.json({code: 2, msg: sails.__('file.upload.err') + ' ' + err});
      } else {
        sails.log.debug('uploadedFiles:::' + JSON.stringify(uploadedFiles));
        var type = uploadedFiles[0].type;
        var fd = uploadedFiles[0].fd;
        var filename = uploadedFiles[0].filename;
        if (uploadedFiles.length === 0) {
          return res.json({code: 2, msg: sails.__('file.upload.err')});
        } else if (type.indexOf('image') != 0) {
          return res.json({code: 3, msg: sails.__('file.upload.only.image')});
        } else {
          if (err)return res.json({code: 2, msg: sails.__('file.upload.err') + ' ' + err});
          WechatService.init_id(wxid, function (api) {
            api.uploadThumbMaterial(fd, function (e, r) {
              if (!e) {
                return res.json({code: 0, msg: sails.__('file.upload.ok'), filename: filename, media_id: r.media_id});
              } else {
                return res.json({code: 2, msg: sails.__('file.upload.err') + ' ' + e});
              }
            });
          });
        }
      }
    });
  },
  addDo:function(req,res){
    var body=req.body;
    body.createdBy=req.session.user.id;
    Wx_mass_news.create(body).exec(function (e, o) {
      if (e)return res.json({code: 1, msg: sails.__('add.fail')});
      return res.json({code: 0, msg: sails.__('add.ok')});
    });
  },
  deleteNews: function (req, res) {
    var ids = req.params.id || req.body.ids;
    Wx_mass_news.destroy({id: ids}).exec(function (err) {
      if (err) {
        return res.json({code: 1, msg: sails.__('delete.fail')});
      } else {
        return res.json({code: 0, msg: sails.__('delete.ok')});
      }
    });
  },
  select:function(req,res){
    req.data.wxid = req.params.id || '';
    return res.view('private/wx/msg/mass/select', req.data);
  },
  send:function(req,res){
    req.data.wxid = req.params.id || '';
    return res.view('private/wx/msg/mass/send', req.data);
  },
  sendDo:function(req,res){
    sails.log.debug(req.body);
    var wxid=req.body.wxid||'';
    var type=req.body.type||'';//text  news
    var content=req.body.content||'';//news==ids
    var scope=req.body.scope||'';//some==ids
    var openids=req.body.openids||'';// one  more
    var openidList=[];
    async.waterfall([function (cb) {
      //获取接收人清单
      if(scope==all){
        Wx_user.find({select:['openid'],where:{wxid:wxid,subscribe:1}}).exec(function(e,l){
          return cb(null,l||[]);
        });
      }else{
        var returnStr=[];
        if(openids.indexOf(',')>0){
          var str=[];
          str=openids.split(",");
          str.forEach(function(so){
            if(so&&so.length>1){
              returnStr.push(so);
            }
          });
        }else{
          returnStr.push(openids);
        }
        return cb(null,str);
      }
    },function(olist,cb){
      //根据发送类型 获取media_id
      openidList=olist;
      sails.log.debug('openidList::'+JSON.stringify(openidList));
      if(type=='news'){
        var articles=[];

      }else{
        return cb(null,'');
      }
    },function(olist,cb){
      //创建发送表
      req.body.createdBy=req.session.user.id;
      req.body.status=0;
      req.body.media_id='';
      Wx_mass.create(req.body).exec(function(e,o){

      });
      if(openidList.length<=1000){

      }else{

      }
    }],function(err,result){

    });

    return res.json({code:1,msg:''});
  }
};
