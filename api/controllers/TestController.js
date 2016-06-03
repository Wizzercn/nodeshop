/**
 * Created by root on 9/9/15.
 */
var md5 = require('md5');
var reqq = require('request');
var StringUtil = require('../common/StringUtil');
var querystring = require('querystring');
module.exports = {
  login: function (req, res) {
    return res.view('private/login.ejs', {layout: 'layouts/login'});
  },
  kuaidi: function (req, res) {
    KuaidiService.init('SF', '033813206167',function(r){
      return res.json(r);
    });
  }
};
