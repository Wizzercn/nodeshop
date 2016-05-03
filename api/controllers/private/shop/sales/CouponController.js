/**
 * Created by wizzer on 2016/5/3.
 */
var moment = require('moment');
var StringUtil = require('../../../../common/StringUtil');
module.exports = {
  index: function (req, res) {
    return res.view('private/shop/sales/coupon/index', req.data);
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
    Shop_sales_coupon.count(where).exec(function (err, count) {
      if (!err && count > 0) {
        Shop_sales_coupon.find(where)
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
  add: function (req, res) {
    return res.view('private/shop/sales/coupon/add', req.data);
  },
  addDo: function (req, res) {
    var body = req.body;
    var name = body.name;
    Shop_sales_coupon.findOne({name: name}).exec(function (err, obj) {
      if (obj) {
        return res.json({code: 1, msg: sails.__('add.exist')});
      } else {
        body.disabled=body.disabled=='1';
        body.createdBy = req.session.user.id;
        Shop_sales_coupon.create(body).exec(function (e, o) {
          if (e)return res.json({code: 1, msg: sails.__('add.fail')});
          return res.json({code: 0, msg: sails.__('add.ok')});
        });
      }
    });
  },
  edit: function (req, res) {
    var id = req.params.id;
    Shop_sales_coupon.findOne({id: id}).exec(function (err, obj) {
      req.data.obj = obj;
      return res.view('private/shop/sales/coupon/edit', req.data);
    });
  },
  editDo: function (req, res) {
    var body = req.body;
    body.disabled=body.disabled=='1';
    Shop_sales_coupon.update({id: body.id}, body).exec(function (err, obj) {
      if (err)return res.json({code: 1, msg: sails.__('update.fail')});
      return res.json({code: 0, msg: sails.__('update.ok')});
    });
  },
  /**
   * 启用
   * @param req
   * @param res
   */
  enable: function (req, res) {
    var id = req.params.id;
    Shop_sales_coupon.update({id: id}, {disabled: false}).exec(function (err, obj) {
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
    Shop_sales_coupon.update({id: id}, {disabled: true}).exec(function (err, obj) {
      if (err) {
        return res.json({code: 1, msg: sails.__('update.fail')});
      } else {
        return res.json({code: 0, msg: sails.__('update.ok')});
      }
    });
  },
  delete: function (req, res) {
    var ids = req.params.id || req.body.ids;
    if(ids==sails.config.system.ShopConfig.member_reg_coupon||ids==sails.config.system.ShopConfig.member_weixinreg_coupon
      ||ids.indexOf(sails.config.system.ShopConfig.member_reg_coupon+'')>-1
      ||ids.indexOf(sails.config.system.ShopConfig.member_weixinreg_coupon+'')>-1
    ){
      return res.json({code: 1, msg: '请先到“注册营销”中解绑优惠券'});
    }
    Shop_sales_coupon.destroy({id: ids}).exec(function (err) {
      if (err)
        return res.json({code: 1, msg: sails.__('delete.fail')});
      Shop_member_coupon.update({couponId:ids},{status:2}).exec(function(e,o){});
      return res.json({code: 0, msg: sails.__('delete.ok')});

    });
  }
};
