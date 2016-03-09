/**
 * Created by root on 9/3/16.
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
    app_type:{
      type: 'string',
      size:10
    },
    app_key:{
      type: 'string',
      size:20
    },
    app_secret:{
      type: 'string',
      size:50
    },
    sms_sign_name:{
      type: 'string',
      size:10
    },
    //用户注册验证码模板
    sms_reg_template:{
      type: 'string',
      size:20,
      defaultsTo: function () {
        return 'SMS_2675019';
      }
    },
    //身份验证验证码模板
    sms_check_template:{
      type: 'string',
      size:20,
      defaultsTo: function () {
        return 'SMS_2675022';
      }
    },
    //登陆确认验证码模板
    sms_login_template:{
      type: 'string',
      size:20,
      defaultsTo: function () {
        return 'SMS_2675021';
      }
    },
    //修改密码验证码模板
    sms_password_template:{
      type: 'string',
      size:20,
      defaultsTo: function () {
        return 'SMS_2675017';
      }
    },
    updatedAt: {
      type: 'integer',
      defaultsTo: function () {
        return moment().format('X');
      }
    }
  }
};

