/**
 * Created by root on 10/29/15.
 */
var API = require('wechat-api');
var moment = require('moment');
module.exports = {
  init: function (req, res, callback) {
    var wxid = req.body.wxid;
    var now = moment().format('X');
    Wx_config.findOne(wxid).exec(function (err, obj) {
      var api = new API(obj.appid, obj.appsecret);
      if (obj.access_token && now - obj.expire_time < 7150) {
        api.store = {accessToken: obj.access_token, expireTime: obj.expire_time * 1000};
        callback(api);
      } else {
        api.getAccessToken(function (e, token) {
          if(token){
            api.store = token;
            Wx_config.update({id: wxid}, {access_token: token.accessToken, expire_time: now}).exec(function (eu, ou) {
            });
          }
          callback(api);
        });
      }
    });
  }
};
