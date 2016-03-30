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
      size:50
    },
    realname:{
      type: 'string',
      size:50
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
      size:5
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
  }
};
