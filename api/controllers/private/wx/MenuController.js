/**
 * Created by root on 10/28/15.
 */
var StringUtil = require('../../../common/StringUtil');
module.exports = {
  index: function (req, res) {
    var wxid = req.params.id || '';
    Wx_config.find().exec(function (err, list) {
      if (!wxid && list && list.length > 0) {
        wxid = list[0].id;
      }
      req.data.list = list;
      req.data.wxid = wxid;
      if (wxid) {
        Wx_menu.find({wxid: wxid}).sort({location: "asc"}).sort({path: "asc"}).exec(function (err, menus) {
          req.data.menus = menus;
          return res.view('private/wx/menu/index', req.data);
        });
      } else {
        return res.view('private/wx/menu/index', req.data);
      }
    });
  },
  add: function (req, res) {
    var wxid = req.params.id || '';
    Wx_menu.find({wxid: wxid, parentId: 0}).sort({location: "asc"}).sort({path: "asc"}).exec(function (err, menus) {
      req.data.menus = menus;
      req.data.wxid = wxid;
      return res.view('private/wx/menu/add', req.data);
    });
  },
  checkDo: function (req, res) {
    var wxid = req.body.wxid;
    var parentId = parseInt(req.body.parentId);
    if (parentId == 0) {
      Wx_menu.count({parentId: 0, wxid: wxid}).exec(function (ec, num) {
        console.log('num:::'+num);
        if (num > 2) {
          return res.json({code: 1, msg: '只可设置三个一级菜单'});
        }
        return res.json({code: 0, msg: ''});
      });
    } else {
      Wx_menu.count({parentId: parentId, wxid: wxid}).exec(function (ec, num) {
        if (num > 4) {
          return res.json({code: 1, msg: '只可设置五个二级菜单'});
        }
        return res.json({code: 0, msg: ''});
      });
    }
  },
  addDo: function (req, res) {
    var body = req.body;
    var wxid = body.wxid;
    var parentId = parseInt(body.parentId);

    Wx_menu.findOne({id: parentId}).exec(function (err, m) {
      var path = '';
      if (m)path = m.path || '';
      Wx_menu.find().where({parentId: parentId}).sort({path: 'desc'}).limit(1).exec(function (ferr, objs) {
        if (objs.length > 0) {
          var num = parseInt(objs[0].path) + 1;
          path = StringUtil.getPath(num, objs[0].path.length);
        } else {
          path = path + '0001';
        }
        body.path = path;
        body.location = 0;
        body.createdBy = req.session.user.id;
        Wx_menu.create(body).exec(function (cerr, obj) {
          if (cerr || !obj)return res.json({code: 1, msg: sails.__('add.fail')});
          if (parentId > 0) {
            Wx_menu.update({id: parentId}, {hasChildren: true}).exec(function (e, o) {
            });
          }
          return res.json({code: 0, msg: sails.__('add.ok')});
        });
      });
    });
  },
  keyword: function (req, res) {
    req.data.wxid = req.params.id || '';
    return res.view('private/wx/menu/keyword', req.data);
  },
  keywordData: function (req, res) {
    var pageSize = parseInt(req.body.length);
    var start = parseInt(req.body.start);
    var page = start / pageSize + 1;
    var draw = parseInt(req.body.draw);
    var order = req.body.order || [];
    var wxid = req.body.wxid || '';
    var columns = req.body.columns || [];
    var sort = {};
    var where = {wxid: wxid, type: 'keyword'};
    if (order.length > 0) {
      sort[columns[order[0].column].data] = order[0].dir;
    }
    Wx_reply.count(where).exec(function (err, count) {
      if (!err && count > 0) {
        Wx_reply.find(where)
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
  }
};
