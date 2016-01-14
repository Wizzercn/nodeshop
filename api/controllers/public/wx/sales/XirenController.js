/**
 * Created by root on 9/9/15.
 */
var OAuth = require('wechat-oauth');
var moment = require('moment');
var StringUtil = require('../../../../common/StringUtil');
module.exports = {
  index: function (req, res) {
    var id = req.params.id;
    var fromId = req.query.fromId || 0;
    var code = req.query.code;
    Wx_sales.findOne(id).exec(function (err, sales) {
      if (err) {
        req.data.sales = {};
        req.data.fromId = fromId;
        return res.view('public/wx/sales/xiren/index', req.data);
      } else {
        req.data.sales = sales;
        Wx_sales_log.create({wxid: sales.wxid, salesid: sales.id, ip: req.ip}).exec(function (e, log) {
          if (code) {
            Wx_config.findOne(sales.wxid).exec(function (ec, oc) {
              var api = new OAuth(oc.appid, oc.appsecret);
              api.getAccessToken(code, function (ew, ow) {
                if (ow && ow.data) {
                  var openid = ow.data.openid;
                  Wx_sales_log.update({id: log.id}, {openid: openid}).exec(function (eu, ou) {

                  });
                }
              });
            });
          }
          req.data.log = log;
          req.data.fromId = fromId;
          return res.view('public/wx/sales/xiren/index', req.data);
        });
      }
    });
  },
  join: function (req, res) {
    var name = req.body.name || '';
    var logid = req.body.logid || 0;
    var fromId = req.body.fromId || 0;

    Wx_sales_log.findOne(logid).exec(function (e, o) {
      if (o) {
        var wxid = o.wxid;
        var salesid = o.salesid;
        var openid = o.openid;
        if (openid != null) {
          Wx_sales.findOne({id: salesid}).exec(function (se, sobj) {
            var now = moment().format('X');
            if (sobj.disabled) {
              return res.json({code: 1, msg: '活动尚未开始~~'});
            } else if (now < sobj.startTime) {
              return res.json({code: 1, msg: '活动尚未开始~~'});

            } else if (now > sobj.endTime) {
              return res.json({code: 1, msg: '活动已经结束~~'});
            } else {
              if (sobj.joinType == 1) {
                Wx_user.findOne({openid: openid, wxid: wxid}).exec(function (e5, o5) {
                  if (o5) {
                    return res.json({code: 1, msg: '本活动只允许新用户参加~~'});
                  } else {
                    Wx_sales_user.findOne({openid: openid, salesid: salesid}).exec(function (e1, o1) {
                      if (o1) {
                        Wx_sales_user.update({id: o1.id}, {name: name}).exec(function (eu, ou) {
                          return res.json({code: 2, msg: o1.logid});
                        });
                      } else {
                        var data = {};
                        data.openid = o.openid;
                        data.name = name;
                        data.logid = logid;
                        data.salesid = o.salesid;
                        data.wxid = o.wxid;
                        data.fromId = fromId;
                        Wx_sales_user.create(data).exec(function (e2, o2) {
                          if (o2) {
                            return res.json({code: 0, msg: 'has exist'});
                          } else {
                            return res.json({code: 1, msg: JSON.stringify(e2)});
                          }
                        });
                      }
                    });
                  }
                });
              } else {
                Wx_sales_user.findOne({openid: openid, salesid: salesid}).exec(function (e1, o1) {
                  if (o1) {
                    Wx_sales_user.update({id: o1.id}, {name: name}).exec(function (eu, ou) {
                      return res.json({code: 2, msg: o1.logid});
                    });
                  } else {
                    var data = {};
                    data.openid = o.openid;
                    data.name = name;
                    data.logid = logid;
                    data.salesid = o.salesid;
                    data.wxid = o.wxid;
                    Wx_sales_user.create(data).exec(function (e2, o2) {
                      if (o2) {
                        return res.json({code: 0, msg: 'has exist a'});
                      } else {
                        return res.json({code: 1, msg: JSON.stringify(e2)});
                      }
                    });
                  }
                });
              }
            }
          });

        } else {
          return res.json({code: 1, msg: '您的打开方式不正确，请重新打开~~'});
        }
      } else {
        return res.json({code: 1, msg: 'err logid'});
      }
    });
  },
  huayu: function (req, res) {
    var salesid = req.query.salesid;
    var logid = req.query.logid;
    var wxid = req.query.wxid;
    var data = req.data;

    data.salesid = salesid;
    data.logid = logid;
    data.wxid = wxid;
    WechatService.init_js(req, res, function (api) {
      var param = {
        debug: false,
        jsApiList: ['onMenuShareTimeline', 'onMenuShareAppMessage'],
        url: 'http://' + sails.config.system.AppDomain + '/public/wx/sales/xiren/huayu?salesid=' + salesid + '&logid=' + logid + '&wxid=' + wxid
      };
      api.getJsConfig(param, function (e1, result) {
        data.jsconfig = result;
        Wx_sales_info.count({salesid: salesid}).exec(function (e2, count) {
          if (count > 0) {
            var num = StringUtil.randomInt(0, count - 1);
            Wx_sales_info.query('SELECT * FROM wx_sales_info LIMIT ?,1', [num], function (e3, obj) {
              data.huayu = obj[0];
              Wx_sales_user.update({logid: logid}, {infoid: obj[0].id}).exec(function (e4, u) {
              });
              Wx_sales_user.findOne({logid: logid}).exec(function (e5, user) {
                data.user = user;
                Wx_sales.findOne({id: salesid}).exec(function (e6, sales) {
                  data.sales = sales;
                  return res.view('public/wx/sales/xiren/huayu', data);
                });
              });
            });
          } else {
            data.huayu = {};
            return res.view('public/wx/sales/xiren/huayu', data);
          }
        });

      });
    });
  },
  share: function (req, res) {
    var logid = req.query.logid;
    Wx_sales_user.update({logid: logid}, {share: 1}).exec(function (e, o) {
      return res.json({code: 0, msg: ''});
    });
  },
  hongbao: function (req, res) {
    var salesid = req.query.salesid;
    var logid = req.query.logid;
    var wxid = req.query.wxid;
    var data = req.data;
    var my = req.query.my;

    data.salesid = salesid;
    data.logid = logid;
    data.wxid = wxid;
    data.my = my;
    Wx_config.findOne({id: wxid}).exec(function (ec, config) {
      data.config = config;
      Wx_sales.findOne({id: salesid}).exec(function (err, sales) {
        data.sales = sales;
        var sendType = sales.sendType;
        var allMoney = sales.budget - sales.hasMoney;
        var money = 0;
        if (sendType == 0) {
          money = sales.money;
        } else {
          money = StringUtil.randomInt(sales.moneyMin, sales.moneyMax);
          if (allMoney > 0 && money > allMoney) {
            money = allMoney;//最后一个红包
          }
        }
        Wx_sales_user.findOne({logid: logid}).exec(function (e5, user) {
          data.user = user;
          if (allMoney > 0 && user.money == 0) {
            var hasMoney = sales.hasMoney + money;
            Wx_sales_user.update({logid: logid}, {money: money}).exec(function (e, o) {
            });
            Wx_sales.update({id: salesid}, {hasMoney: hasMoney}).exec(function (e, o) {
            });
          } else if (user.money > 0) {
            money = user.money;
          }
          data.allMoney = allMoney;
          data.money = money;
          WechatService.init_js(req, res, function (api) {
            var str='http://' + sails.config.system.AppDomain + '/public/wx/sales/xiren/hongbao?salesid=' + salesid + '&logid=' + logid + '&wxid=' + wxid;
            if(my){
              str=str+'&my='+my;
            }
            var param = {
              debug: false,
              jsApiList: ['onMenuShareTimeline', 'onMenuShareAppMessage'],
              url: str
            };
            api.getJsConfig(param, function (e1, result) {
              data.jsconfig = result;

              Wx_sales_info.findOne(user.infoid).exec(function (e6, info) {
                data.huayu = info;
                return res.view('public/wx/sales/xiren/hongbao', data);
              });

            });
          });

        });

      });
    });
  },
  myhuayu: function (req, res) {
    var salesid = req.query.salesid;
    var logid = req.query.logid;
    var wxid = req.query.wxid;
    var my = req.query.my;
    var data = req.data;

    data.salesid = salesid;
    data.logid = logid;
    data.wxid = wxid;
    data.my = my;
    Wx_config.findOne({id: wxid}).exec(function (ec, config) {
      data.config = config;
      Wx_sales.findOne({id: salesid}).exec(function (err, sales) {
        data.sales = sales;
        Wx_sales_user.findOne({logid: logid}).exec(function (e5, user) {
          data.user = user;
          Wx_sales_info.findOne(user.infoid).exec(function (e6, info) {
            data.huayu = info;
            WechatService.init_js(req, res, function (api) {
              var str='http://' + sails.config.system.AppDomain + '/public/wx/sales/xiren/myhuayu?salesid=' + salesid + '&logid=' + logid + '&wxid=' + wxid;
              if(my){
                str=str+'&my='+my;
              }
              var param = {
                debug: false,
                jsApiList: ['onMenuShareTimeline', 'onMenuShareAppMessage'],
                url: str
              };
              api.getJsConfig(param, function (e1, result) {
                data.jsconfig = result;
                Wx_sales_info.findOne(user.infoid).exec(function (e6, info) {
                  data.huayu = info;
                  return res.view('public/wx/sales/xiren/myhuayu', data);
                });

              });
            });
          });
        });
      });
    });
  },
  my: function (req, res) {
    var id = req.params.id;
    var code = req.query.code;
    Wx_sales.findOne(id).exec(function (errsales, sales) {
      Wx_config.findOne(sales.wxid).exec(function (ec, oc) {
        var api = new OAuth(oc.appid, oc.appsecret);
        api.getAccessToken(code, function (ew, ow) {
          if (ow && ow.data) {
            var openid = ow.data.openid;
            Wx_sales_user.findOne({openid: openid, salesid: id, wxid: sales.wxid}).exec(function (euer, user) {
              if (user) {
                res.redirect('/public/wx/sales/xiren/myhuayu?salesid=' + user.salesid + '&logid=' + user.logid + '&wxid=' + user.wxid+'&my=1');
              } else {
                res.redirect('https://open.weixin.qq.com/connect/oauth2/authorize?appid='+oc.appid+'&redirect_uri=http%3A%2F%2F'+sails.config.system.AppDomain+'%2Fpublic%2Fwx%2Fsales%2Fxiren%2Findex%2F'+id+'&response_type=code&scope=snsapi_base&state=11624317#wechat_redirect');
              }
            });
          }
        });
      });
    });
  },
  myhongbao:function(req, res){
    var id = req.params.id;
    var code = req.query.code;
    Wx_sales.findOne(id).exec(function (errsales, sales) {
      Wx_config.findOne(sales.wxid).exec(function (ec, oc) {
        var api = new OAuth(oc.appid, oc.appsecret);
        api.getAccessToken(code, function (ew, ow) {
          if (ow && ow.data) {
            var openid = ow.data.openid;
            Wx_sales_user.findOne({openid: openid, salesid: id, wxid: sales.wxid}).exec(function (euer, user) {
              if (user) {
                res.redirect('/public/wx/sales/xiren/hongbao?salesid=' + user.salesid + '&logid=' + user.logid + '&wxid=' + user.wxid+'&my=1');
              } else {
                res.redirect('https://open.weixin.qq.com/connect/oauth2/authorize?appid='+oc.appid+'&redirect_uri=http%3A%2F%2F'+sails.config.system.AppDomain+'%2Fpublic%2Fwx%2Fsales%2Fxiren%2Findex%2F'+id+'&response_type=code&scope=snsapi_base&state=11624317#wechat_redirect');
              }
            });
          }
        });
      });
    });
  }
};
