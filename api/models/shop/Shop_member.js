/**
 * Created by root on 3/8/16.
 */
var moment = require('moment');
module.exports = {
  schema: true,
  autoCreatedAt: false,
  autoUpdatedAt: false,
  attributes: {
    id: {
      type: 'integer',
      autoIncrement: true,
      primaryKey: true
    },
    lv_id:{
      model: 'Shop_member_lv',
      index:true
    },
    nickname:{
      type: 'string',
      size:100
    },
    realname:{
      type: 'string',
      size:50
    },
    headimgurl:{
      type: 'string',
      size:255
    },
    province:{
      type:'string',
      size:20
    },
    city:{
      type:'string',
      size:20
    },
    area:{
      type:'string',
      size:20
    },
    addr:{
      type:'string',
      size:255
    },
    mobile:{
      type: 'string',
      size:20
    },
    tel:{
      type: 'string',
      size:20
    },
    email:{
      type: 'string',
      size:255
    },
    order_num:{
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    b_year:{
      type: 'integer',
      size:4,
      defaultsTo: function () {
        return 0;
      }
    },
    b_month:{
      type: 'integer',
      size:2,
      defaultsTo: function () {
        return 0;
      }
    },
    b_day:{
      type: 'integer',
      size:2,
      defaultsTo: function () {
        return 0;
      }
    },
    sex:{
      type: 'integer',
      size:1,
      defaultsTo: function () {
        return 0;
      }
    },
    //预存款
    money:{
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    //当订单使用余额支付，并且订单未全部支付时冻结的金额
    money_freeze:{
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    //支付密码：充值时必须设置密码、重置支付密码功能
    money_password:{
      type: 'string',
      size:20
    },
    //积分
    score:{
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    reg_ip:{
      type: 'string'
    },
    reg_time:{
      type: 'integer',
      defaultsTo: function () {
        return moment().format('X');
      }
    },
    reg_source:{
      type: 'string',
      size:10
    },
    accounts: {
      collection: 'Shop_member_account',
      via: 'memberId'
    }

  },
  //会员积分变化后，根据会员等级规则，自动升级会员分组
  afterUpdate:function(obj, next) {
    Shop_member_lv.find({disabled:false,point:{'<=':obj.score}}).sort({point:'desc'}).limit(1).exec(function(lvErr,lv){
      if(lv&&lv.length==1){
        if(obj.lv_id!=lv[0].id){
          Shop_member.update(obj.id,{lv_id:lv[0].id}).exec(function(e,o){
            next();
          });
        }else {
          next();
        }
      }else {
        next();
      }
    });
  },
  syncDataToMember:function(oldId,newId,cb){
    Shop_member_bind.update({weixin:'weixin',memberId:oldId},{memberId:newId}).exec(function(errBind,bind){
    if(errBind){
      return cb(false);
    }
    async.waterfall([function (cb) {
      Shop_member.findOne(oldId).exec(function(oldErr,oldMember){
        Shop_member.findOne(newId).exec(function(newErr,newMember){

            Shop_member.update(newMember.id, {money: newMember.money + oldMember.money,score: newMember.score + oldMember.score}).exec(function (e_u1, m_u1) {
              Shop_member.update(oldMember.id, {money: 0,score:0}).exec(function (e_u2, m_u2) {
                if(oldMember.money>0){
                  Shop_member_money_log.create({
                    memberId: newMember.id,
                    orderId: 0,
                    oldMoney: newMember.money,
                    newMoney: newMember.money + oldMember.money,
                    diffMoney: oldMember.money,
                    note: '帐号绑定余额转入',
                    trade_no: '',
                    createdBy: 0,
                    createdAt: moment().format('X')
                  }).exec(function (em, om) {
                  });
                  Shop_member_money_log.create({
                    memberId: oldMember.id,
                    orderId: 0,
                    oldMoney: oldMember.money,
                    newMoney: 0,
                    diffMoney: oldMember.money,
                    note: '帐号绑定余额转出',
                    trade_no: '',
                    createdBy: 0,
                    createdAt: moment().format('X')
                  }).exec(function (em, om) {
                  });
                }
                if(oldMember.score>0){
                  Shop_member_score_log.create({
                    memberId: newMember.id,
                    orderId: 0,
                    oldScore: newMember.score,
                    newScore: newMember.score + oldMember.score,
                    diffScore: oldMember.score,
                    note: '帐号绑定积分转入',
                    createdBy: 0,
                    createdAt: moment().format('X')
                  }).exec(function (es, os) {
                  });
                  Shop_member_score_log.create({
                    memberId: oldMember.id,
                    orderId: 0,
                    oldScore: oldMember.score,
                    newScore: 0,
                    diffScore: oldMember.score,
                    note: '帐号绑定积分转出',
                    createdBy: 0,
                    createdAt: moment().format('X')
                  }).exec(function (es, os) {
                  });
                }
              });
            });
        });
      });
    }],function(err,obj){
      return cb(true);
    });
    });
  }
};
