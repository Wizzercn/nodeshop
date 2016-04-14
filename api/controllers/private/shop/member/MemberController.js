/**
 * Created by root on 12/4/16.
 */
var moment = require('moment');
var StringUtil = require('../../../../common/StringUtil');
module.exports = {
  index: function (req, res) {
    return res.view('private/shop/member/member/index', req.data);
  },
  data: function (req, res) {
    var pageSize = parseInt(req.body.length);
    var start = parseInt(req.body.start);
    var page = start / pageSize + 1;
    var draw = parseInt(req.body.draw);
    var order = req.body.order || [];
    var columns = req.body.columns || [];
    var sort = {};
    var where = {};
    if (order.length > 0) {
      sort[columns[order[0].column].data] = order[0].dir;
    }
    Shop_member.count(where).exec(function (err, count) {
      if (!err && count > 0) {
        Shop_member.find(where)
          .sort(sort)
          .paginate({page: page, limit: pageSize})
          .populate('lv_id')
          .populate('accounts')
          .populate('binds')
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
  add: function (req, res) {
    Shop_member_lv.find({disabled:false}).exec(function(e,l){
      req.data.lvList=l||[];
      return res.view('private/shop/member/member/add', req.data);
    });
  },
  addDo: function (req, res) {
    var body = req.body;
    var login_name = body.login_name;
    var login_password = body.login_password;
    var mobile = body.mobile;
    var nickname = body.nickname;
    Shop_member_account.findOne({login_name: login_name}).exec(function (err, obj) {
      if (obj) {
        return res.json({code: 1, msg: '用户名已存在'});
      }
      Shop_member.findOne({mobile: mobile}).exec(function (errM, objM) {
        if (objM) {
          return res.json({code: 1, msg: '手机号码已存在'});
        }
        body.createdBy = req.session.user.id;
        Shop_member.create({mobile:mobile,nickname:nickname}).exec(function (e, o) {
          if (e)return res.json({code: 1, msg: sails.__('add.fail')});
          var now=moment().format('X');
          var password=StringUtil.password(login_password,login_name,now);
          Shop_member_account.create({memberId: o.id,login_name:login_name,login_password:password,disabled:false,createdAt:now}).exec(function(e2,o2){
            return res.json({code: 0, msg: sails.__('add.ok')});
          });
        });
      });

    });
  },
  edit: function (req, res) {
    var id = req.params.id;
    Shop_member_lv.findOne({id: id}).exec(function (err, obj) {
      req.data.obj = obj;
      return res.view('private/shop/member/member/edit', req.data);
    });
  },
  editDo: function (req, res) {
    var body = req.body;
    Shop_member_lv.update({id: body.id}, body).exec(function (err, obj) {
      if (err)return res.json({code: 1, msg: sails.__('update.fail')});
      return res.json({code: 0, msg: sails.__('update.ok')});
    });
  },
  detail: function (req, res) {
    Shop_member.findOne(req.params.id)
      .populate('lv_id')
      .populate('accounts')
      .populate('binds')
      .exec(function (err, obj) {
        req.data.obj=obj||{};
        return res.view('private/shop/member/member/detail', req.data);
      });
  }
};
