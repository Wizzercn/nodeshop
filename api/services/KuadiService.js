var md5 = require('md5');
var http = require('http');
var StringUtil = require('../common/StringUtil');
var querystring = require('querystring');
module.exports = {
  kd:function(EBusinessID,RequestData,AppKey,cb){
    var RequestData = encodeURI(RequestData);
    var DataSign = StringUtil.base64Encode(md5(RequestData+AppKey));
    var contents =  querystring.stringify({
      'EBusinessID':EBusinessID,
      'RequestType':'1002',
      'RequestData':RequestData,
      'DataSign':DataSign,
      'DataType':'2',
    });
    var opt = {
      method: "POST",
      host: "api.kdniao.cc",
      port: 80,
      path: "/Ebusiness/EbusinessOrderHandle.aspx",
      headers: {
        "Content-Type": 'application/json',
        'Content-Length': contents.length
      }
    };



    var req  = http.request(opt,function(callback){
      if(callback.statusCode == 200){
        callback.on('data', function(data){
            //console.log(data);
            cb();
        });
      }
    });
    req.write(contents);
    req.end();
  }
}
