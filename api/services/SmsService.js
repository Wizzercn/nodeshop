/**
 * Created by root on 3/8/16.
 */
var TopClient = require('../common/top/topClient').TopClient;
var client;
module.exports = {
  sendVercode:function(mobile,param,template,cb){
    if(!client){
      client = new TopClient({
        'appkey':sails.config.system.SmsConfig.app_key||'',
        'appsecret':sails.config.system.SmsConfig.app_secret||'',
        'REST_URL':'http://gw.api.taobao.com/router/rest'});
    }
    var sign_name=sails.config.system.SmsConfig.sms_sign_name;
    if(!sign_name){
      if(template=='SMS_2675019'){
        sign_name='注册验证';
      }
      if(template=='SMS_2675022'){
        sign_name='身份验证';
      }
      if(template=='SMS_2675021'){
        sign_name='登录验证';
      }
      if(template=='SMS_2675017'){
        sign_name='变更验证';
      }
    }
    client.execute('alibaba.aliqin.fc.sms.num.send',
    {
      'sms_type':'normal',
      'sms_free_sign_name':sign_name,
      'sms_template_code':template,
      'rec_num':mobile,
      'sms_param':param
    },
    function (error,response) {
      sails.log.warn('sms error::'+JSON.stringify(error));

      if(!error)
        cb(response.result.success==true);
      else
        cb(false);
    })
  }
};
