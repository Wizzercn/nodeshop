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
    var id = req.body.id;
    var nickname = req.body.nickname;
    var mobile = req.body.mobile;
    var sort = {};
    var where = {};
    if (order.length > 0) {
      sort[columns[order[0].column].data] = order[0].dir;
    }
    if(id){
      where.id=id;
    }
    if(nickname){
      where.nickname={like:'%'+nickname+'%'};
    }
    if(mobile){
      where.mobile={like:'%'+mobile+'%'};
    }
    Shop_member.count(where).exec(function (err, count) {
      if (!err && count > 0) {
        Shop_member.find(where)
          .sort(sort)
          .paginate({page: page, limit: pageSize})
          .populate('lv_id')
          .populate('accounts')
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
    Shop_member_lv.find({disabled: false}).exec(function (e, l) {
      req.data.lvList = l || [];
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
        Shop_member.create({mobile: mobile, nickname: nickname}).exec(function (e, o) {
          if (e)return res.json({code: 1, msg: sails.__('add.fail')});
          var now = moment().format('X');
          var password = StringUtil.password(login_password, login_name, now);
          Shop_member_account.create({
            memberId: o.id,
            login_name: login_name,
            login_password: password,
            disabled: false,
            createdAt: now
          }).exec(function (e2, o2) {
            return res.json({code: 0, msg: sails.__('add.ok')});
          });
        });
      });

    });
  },
  edit: function (req, res) {
    var id = req.params.id;
    Shop_member_lv.find({disabled: false}).exec(function (e, l) {
      req.data.lvList = l || [];
      Shop_member.findOne({id: id}).populate('accounts').exec(function (err, obj) {
        req.data.obj = obj;
        req.data.moment = moment;
        req.data.StringUtil = StringUtil;
        return res.view('private/shop/member/member/edit', req.data);
      });
    });
  },
  editDo: function (req, res) {
    var body = req.body;
    var oldMobile=req.body.oldMobile||'';
    var mobile=req.body.mobile||'';
    var id=req.body.id||'';
    var mm=req.body.mm=='on';
    var pass=req.body.pass||'';
    async.waterfall([function (cb) {
      if(oldMobile!=mobile&&mobile){
        Shop_member.findOne({mobile: mobile}).exec(function (errM, objM) {
          if (objM) {
            return cb({code:1},true);
          }
          else return cb(null,false);
        });
      }else return cb(null,false);
    },function(hasMobile,cb){
      Shop_member.update({id: body.id}, body).exec(function (err, list) {
        return cb(err,list);
      });
    },function(l,cb){
      if(mm&&pass.length>0){
        Shop_member_account.find({memberId:id}).exec(function(err,list){
          list.forEach(function(o){
            var new_pass=StringUtil.password(pass, o.login_name, o.createdAt);
            Shop_member_account.update(o.id,{login_password:new_pass}).exec(function(ea,oa){

            });
          });
        });
      }
      return cb(null,'');
    }],function(err,obj){
      if (err){
        if(err.code==1){
          return res.json({code: 1, msg: '手机号码已存在'});
        }else return res.json({code: 1, msg: sails.__('update.fail')});
      }
      return res.json({code: 0, msg: sails.__('update.ok')});
    });
  },
  detail: function (req, res) {
    Shop_member.findOne(req.params.id)
      .populate('lv_id')
      .populate('accounts')
      .populate('binds')
      .exec(function (err, obj) {
        req.data.obj = obj || {};
        req.data.moment = moment;
        req.data.StringUtil = StringUtil;
        return res.view('private/shop/member/member/detail', req.data);
      });
  },
  money: function (req, res) {
    var id=req.params.id||'';
    Shop_member.findOne({select:['id','money'],where:{id:id}}).exec(function (err, obj) {
      req.data.obj=obj||{};
      req.data.moment = moment;
      req.data.StringUtil = StringUtil;
      Shop_member_money_log.find({memberId:id}).sort({createdAt:'desc'}).limit(10).exec(function(e,l){
        req.data.list = l||[];
        return res.view('private/shop/member/member/money', req.data);
      });
    });
  },
  doMoney:function(req,res){
    var id=req.body.id||'';
    var txt=req.body.txt||'';
    var money=StringUtil.getInt(StringUtil.getFloat(req.body.money)*100)||0;
    if(money==0){
      return res.json({code:1,msg:'充值金额不可为0'});
    }
    Shop_member.findOne(id).exec(function (err, m) {
      if(m.money +money<0){
        return res.json({code:1,msg:'预存款不可为负值'});
      }
      Shop_member.update(id, {money: m.money +money}).exec(function (e_3, m2) {
        //余额日志
        Shop_member_money_log.create({
          memberId: m.id,
          orderId: 0,
          oldMoney: m.money,
          newMoney: m.money + money,
          diffMoney: Math.abs(money),
          note: '管理员操作:'+txt,
          trade_no: '',
          createdBy: req.session.user.id,
          createdAt: moment().format('X')
        }).exec(function (em, om) {
          return res.json({code:0,msg:''});
        });
      });
    });
  },
  score: function (req, res) {
    var id=req.params.id||'';
    Shop_member.findOne({select:['id','score'],where:{id:id}}).exec(function (err, obj) {
      req.data.obj=obj||{};
      req.data.moment = moment;
      req.data.StringUtil = StringUtil;
      Shop_member_score_log.find({memberId:id}).sort({createdAt:'desc'}).limit(10).exec(function(e,l){
        req.data.list = l||[];
        return res.view('private/shop/member/member/score', req.data);
      });
    });
  },
  doScore:function(req,res){
    var id=req.body.id||'';
    var txt=req.body.txt||'';
    var score=StringUtil.getInt(req.body.score)||0;
    if(score==0){
      return res.json({code:1,msg:'调整积分不可为0'});
    }
    Shop_member.findOne(id).exec(function (err, m) {
      if(m.score +score<0){
        return res.json({code:1,msg:'积分不可为负值'});
      }
      Shop_member.update(id, {score: m.score +score}).exec(function (e_3, m2) {
        //余额日志
        Shop_member_score_log.create({
          memberId: m.id,
          orderId: 0,
          oldScore: m.score,
          newScore: m.score + score,
          diffScore: Math.abs(score),
          note: '管理员操作:'+txt,
          trade_no: '',
          createdBy: req.session.user.id,
          createdAt: moment().format('X')
        }).exec(function (em, om) {
          return res.json({code:0,msg:''});
        });
      });
    });
  },
  coupon: function (req, res) {
    var id=req.params.id||'';
    Shop_sales_coupon.find({disabled:false}).exec(function(couponErr,couponList){
      req.data.couponList = couponList||[];
      req.data.moment = moment;
      req.data.StringUtil = StringUtil;
      req.data.id = id;
      Shop_member_coupon.find({memberId:id,status:0}).sort({couponPrice:'asc'}).exec(function(e,l){
        req.data.list = l||[];
        return res.view('private/shop/member/member/coupon', req.data);
      });
    });
  },
  doCoupon:function(req,res){
    var id=req.body.id||'';
    var couponId=req.body.couponId||'';
    Shop_sales_coupon.findOne(couponId).exec(function(e1,coupon){
      if(e1)
        return res.json({code:1,msg:'赠送失败'});
        Shop_member_coupon.create({
          memberId: id,
          couponId:couponId,
          couponName:coupon.name,
          couponPrice:coupon.price,
          status:0,
          createdAt:moment().format('X')
        }).exec(function(e3,o3){
          if(e3)
            return res.json({code:1,msg:'赠送失败'});
          return res.json({code:0,msg:'赠送成功'});
        });
    });
  },
  delete: function (req, res) {
    var ids = req.params.id || req.body.ids;
    Shop_member.destroy({id: ids}).exec(function (err) {
      if (err){
        return res.json({code: 1, msg: sails.__('delete.fail')});
      }else{
        Shop_member_account.destroy({memberId:ids}).exec(function(e){});
        Shop_member_bind.destroy({memberId:ids}).exec(function(e){});
        Shop_member_addr.destroy({memberId:ids}).exec(function(e){});
        Shop_member_coupon.destroy({memberId:ids}).exec(function(e){});
        Shop_member_comment.destroy({memberId:ids}).exec(function(e){});
        Shop_member_cart.destroy({memberId:ids}).exec(function(e){});
        return res.json({code: 0, msg: sails.__('delete.ok')});
      }
    });
  },
  order: function (req, res) {
    var id=req.params.id||'';
    req.data.moment = moment;
    req.data.StringUtil = StringUtil;
    req.data.id = id;
    return res.view('private/shop/member/member/order', req.data);
  },
  orderData: function (req, res) {
    var id=req.params.id||'';
    var pageSize = parseInt(req.body.length);
    var start = parseInt(req.body.start);
    var page = start / pageSize + 1;
    var draw = parseInt(req.body.draw);
    var order = req.body.order || [];
    var columns = req.body.columns || [];
    var sort = {};
    var where = {memberId:id,disabled:false};
    if (order.length > 0) {
      sort[columns[order[0].column].data] = order[0].dir;
    }
    Shop_order.count(where).exec(function (err, count) {
      if (!err && count > 0) {
        Shop_order.find(where)
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
