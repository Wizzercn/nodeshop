/**
 * Created by wizzer on 2016/4/20.
 */
var moment = require('moment');
var StringUtil = require('../../../../common/StringUtil');
module.exports = {
  index: function (req, res) {
    var type=req.query.type||1;
    req.data.type=type;
    return res.view('private/shop/member/comment/index'+type, req.data);
  },
  data: function (req, res) {
    var type=req.params.id||1;
    var pageSize = parseInt(req.body.length);
    var start = parseInt(req.body.start);
    var page = start / pageSize + 1;
    var draw = parseInt(req.body.draw);
    var order = req.body.order || [];
    var columns = req.body.columns || [];
    var sort = {};
    var where = {type:type};
    if (order.length > 0) {
      sort[columns[order[0].column].data] = order[0].dir;
    }
    Shop_member_comment.count(where).exec(function (err, count) {
      if (!err && count > 0) {
        Shop_member_comment.find(where)
          .sort(sort)
          .populate('goodsId',{select:['id','name']})
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
  /**
   * 启用
   * @param req
   * @param res
   */
  enable: function (req, res) {
    var id = req.params.id;
    Shop_member_comment.update({id: id}, {disabled: false}).exec(function (err, obj) {
      if (err) {
        return res.json({code: 1, msg: sails.__('update.fail')});
      } else {
        return res.json({code: 0, msg: sails.__('update.ok')});
      }
    });
  },
  /**
   * 禁用
   * @param req
   * @param res
   */
  disable: function (req, res) {
    var id = req.params.id;
    Shop_member_comment.update({id: id}, {disabled: true}).exec(function (err, obj) {
      if (err) {
        return res.json({code: 1, msg: sails.__('update.fail')});
      } else {
        return res.json({code: 0, msg: sails.__('update.ok')});
      }
    });
  },
  detail: function (req, res) {
    var id = req.params.id;
    Shop_member_comment.findOne(id).populate('goodsId',{select:['id','name']}).exec(function (err, obj) {
      req.data.obj=obj||{};
      req.data.moment=moment;
      req.data.StringUtil=StringUtil;
      return res.view('private/shop/member/comment/detail', req.data);
    });
  },
  save: function (req, res) {
    var id = req.body.id;
    var txt = req.body.txt||'';
    var ck = req.body.ck=='1';
    Shop_member_comment.update(id,{disabled:ck,replyId:req.session.user.id,replyNickname:req.session.user.nickname,replyNote:txt,replyAt:moment().format('X')}).exec(function (err, obj) {
      if (err)res.json({code: 1, msg: sails.__('update.fail')});
      return res.json({code: 0, msg: sails.__('update.ok')});
    });
  }
};
