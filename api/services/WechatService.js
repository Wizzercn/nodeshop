/**
 * Created by root on 10/29/15.
 */
var API = require('wechat-api');
var moment = require('moment');
module.exports = {
  init: function (req, res, callback) {
    var wxid='';
    if(req.body&&req.body.wxid){
      wxid = req.body.wxid;
    }else if(req.query&&req.query.wxid){
      wxid = req.query.wxid;
    }
    var now = moment().format('X');
    Wx_config.findOne(wxid).exec(function (err, obj) {
      var api = new API(obj.appid, obj.appsecret);
      if (obj.access_token && now - obj.expire_time < 7150) {
        api.store = {accessToken: obj.access_token, expireTime: obj.expire_time * 1000};
        callback(api);
      } else {
        api.getAccessToken(function (e, token) {
          if (token) {
            api.store = token;
            Wx_config.update({id: wxid}, {access_token: token.accessToken, expire_time: now}).exec(function (eu, ou) {
            });
          }
          callback(api);
        });
      }
    });
  },
  init_js: function (req, res, callback) {
    var wxid='';
    if(req.body&&req.body.wxid){
      wxid = req.body.wxid;
    }else if(req.query&&req.query.wxid){
      wxid = req.query.wxid;
    }
    var now = moment().format('X');
    WechatService.init(req, res, function (api) {
      Wx_config.findOne(wxid).exec(function (err, obj) {
        if (obj.jsapi_ticket && now - obj.jsapi_time < 7150) {
          api.ticketStore = {'jsapi':{'ticket':obj.jsapi_ticket,'expireTime':obj.expire_time * 1000}};
          callback(api);
        } else {
          api.getTicket(function (e, result) {
            sails.log.warn(JSON.stringify(result));
            if (result) {
              Wx_config.update({id: wxid}, {jsapi_ticket: result.ticket, jsapi_time: now}).exec(function (eu, ou) {
              });
            }
            callback(api);
          });
        }
      });
    });
  }
};
