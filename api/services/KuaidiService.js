var md5 = require('md5');
var httpreq = require('request');
var StringUtil = require('../common/StringUtil');
module.exports = {
  init: function (ShipperCode, LogisticCode,cb) {
    try {
      if (sails.config.system.ShopConfig.logistics_open && sails.config.system.ShopConfig.logistics_info) {
        var logistics_info = sails.config.system.ShopConfig.logistics_info;
        if ('kdn' == logistics_info.lg_appname) {
          var obj = {
            OrderCode: '',
            ShipperCode: ShipperCode,
            LogisticCode: LogisticCode
          };
          var RequestData = JSON.stringify(obj);
          var DataSign = StringUtil.base64Encode(md5(RequestData + logistics_info.lg_appkey));
          httpreq.post('http://api.kdniao.cc/Ebusiness/EbusinessOrderHandle.aspx',{form:{
            'EBusinessID': logistics_info.lg_appid,
            'RequestType': '1002',
            'RequestData': encodeURI(RequestData),
            'DataSign': DataSign,
            'DataType': '2'
          }}, function (e, r, body) {
            if (!e && r.statusCode == 200) {
              return cb({code: 0, msg: '', data: JSON.parse(body)});
            }else{
              return cb({code:1,msg:'err'});
            }
          });
        }else return cb({code:1,msg:'err'});
      } else
        return cb({code:1,msg:'err'});
    } catch (err) {
      return cb({code:1,msg:'err::'+err});
    }
  }
};
