/**
 * Created by root on 3/31/16.
 */
var StringUtil = require('../../../../common/StringUtil');
var moment = require('moment');
module.exports = {
  oauth:function(req,res){
    var wechat_goto_url=req.query.goto_url||'';
    req.session.wechat_goto_url=wechat_goto_url;

  }
};
