/**
 * 帐号登录/注册
 * Created by root on 3/8/16.
 */
var captchapng = require('captchapng');
var StringUtil = require('../../../../common/StringUtil');
var moment = require('moment');
var emoji = require('emoji');
module.exports = {
  join: function (req, res) {
    async.parallel({
      //获取cms栏目分类
      channelList: function (done) {
        Cms_channel.getChannel(function (list) {
          done(null, list);
        });
      },
      bannerLink: function (done) {
        Cms_linkClass.getLinkList('登录页背景', function (list) {
          done(null, list);
        });
      }

    }, function (err, result) {

      req.data.channelList = result.channelList || [];
      req.data.bannerLink = result.bannerLink || {};
      req.data.StringUtil = StringUtil;
      req.data.moment = moment;
      return res.view('public/shop/' + sails.config.system.ShopConfig.shop_templet + '/pc/account_join', req.data);
    });
  },
  login: function (req, res) {
    async.parallel({
      //获取cms栏目分类
      channelList: function (done) {
        Cms_channel.getChannel(function (list) {
          done(null, list);
        });
      },
      bannerLink: function (done) {
        Cms_linkClass.getLinkList('登录页背景', function (list) {
          done(null, list);
        });
      }

    }, function (err, result) {
      req.data.channelList = result.channelList || [];
      req.data.bannerLink = result.bannerLink || {};
      req.data.StringUtil = StringUtil;
      req.data.moment = moment;
      req.data.saveLoginname = req.cookies.saveLoginname || '';
      return res.view('public/shop/' + sails.config.system.ShopConfig.shop_templet + '/pc/account_login', req.data);
    });
  },
  doLogin: function (req, res) {
    var login_name = req.body.login_name || '';
    var login_pass = req.body.login_pass || '';
    var vercode = req.body.vercode || '';
    var saveLoginname = req.body.saveLoginname == 'true';
    var publicCaptcha = req.session.publicCaptcha || '';
    if (vercode == publicCaptcha) {
      Shop_member_account.findOne({
        login_name: login_name
      }).populate('memberId').exec(function (err, obj) {
        if (obj && obj.disabled) {
          return res.json({code: 3, msg: '用户已被禁用，请联系客服'});
        } else if (obj && obj.login_password == StringUtil.password(login_pass, login_name, obj.createdAt)) {
          if (obj.memberId) {
            req.session.member = {
              memberId: obj.memberId.id,
              nickname: obj.memberId.nickname,
              login_name: login_name,
              loginIp: obj.loginIp,
              loginAt: obj.loginAt
            };
          }
          //记录登录IP和时间
          Shop_member_account.update(obj.id, {
            loginIp: StringUtil.getIp(req),
            loginAt: moment().format('X')
          }).exec(function (ep, op) {
          });
          if (saveLoginname) {
            res.cookie('saveLoginname', login_name, {
              maxAge: 1000 * 60 * 60 * 24 * 30,
              httpOnly: true,
              path: '/',
              secure: false
            });
          } else {
            res.cookie('saveLoginname', 'null', {maxAge: 0});
          }
          //将cookies购物车数据同步到数据库
          Shop_member_cart.updateCookieCartDataToDb(req, res, obj.memberId, function () {
            return res.json({code: 0, msg: '登录成功'});
          });
        } else {
          return res.json({code: 2, msg: '用户名或密码错误'});
        }
      });
    } else {
      return res.json({code: 1, msg: '验证码不正确'});
    }
  },
  doLoginMobile: function (req, res) {
    var mobile = req.body.mobile || '';
    var smscode = req.body.smscode || '';
    if (mobile.length != 11)
      return res.json({code: 1, msg: '手机动态密码不正确'});
    RedisService.get('sms_vercode_' + mobile, function (e, o) {
      if (o && smscode == o.toString()) {
        Shop_member_account.findOne({
          login_name: mobile
        }).populate('memberId').exec(function (err, obj) {
          if (obj && obj.disabled) {
            return res.json({code: 3, msg: '用户已被禁用，请联系客服'});
          } else if (obj) {
            if (obj.memberId) {
              req.session.member = {
                memberId: obj.memberId.id,
                nickname: obj.memberId.nickname,
                login_name: mobile,
                loginIp: obj.loginIp,
                loginAt: obj.loginAt
              };
            }
            //记录登录IP和时间
            Shop_member_account.update(obj.id, {
              loginIp: StringUtil.getIp(req),
              loginAt: moment().format('X')
            }).exec(function (ep, op) {
            });
            //将cookies购物车数据同步到数据库
            Shop_member_cart.updateCookieCartDataToDb(req, res, obj.memberId, function () {
              return res.json({code: 0, msg: '登录成功'});
            });
          } else {
            return res.json({code: 2, msg: '用户不存在'});
          }
        });
      } else {
        return res.json({code: 1, msg: '手机动态密码不正确，请重新获取'});
      }
    });
  },
  doJoin: function (req, res) {
    var mobile = req.body.mobile || '';
    var smscode = req.body.smscode || '';
    var pass = req.body.pass || '';
    if (mobile.length != 11)
      return res.json({code: 1, msg: '手机校验码不正确'});
    RedisService.get('sms_vercode_' + mobile, function (e, o) {
      if (o && smscode == o.toString()) {
        Shop_member_account.findOne({login_name: mobile}).exec(function (err, obj) {
          if (obj)return res.json({code: 2, msg: '帐号已存在，请更换手机号注册'});
          Shop_member.create({
            lv_id: 0,
            nickname: mobile.substring(0, 3) + '****' + mobile.substring(7),
            mobile: mobile,
            reg_ip: StringUtil.getIp(req),
            reg_source: 'pc'
          }).exec(function (err, member) {
            if (member) {
              //新建登录帐号
              var now = moment().format('X');
              var password = StringUtil.password(pass, mobile, now);
              Shop_member_account.create({
                memberId: member.id,
                login_name: mobile,
                login_password: password,
                createdAt: now
              }).exec(function (e3, acc) {
                if (!e3) {
                  req.session.member = {
                    memberId: member.id,
                    nickname: member.nickname,
                    login_name: mobile,
                    loginIp: member.loginIp,
                    loginAt: member.loginAt
                  };
//网页注册赠送优惠券
                  if (sails.config.system.ShopConfig.member_reg_coupon > 0) {
                    Shop_sales_coupon.findOne(sails.config.system.ShopConfig.member_reg_coupon).exec(function (couponErr, coupon) {
                      if (coupon.disabled == false && coupon.maxNum > coupon.hasNum) {
                        Shop_member_coupon.create({
                          memberId: member.id,
                          couponId: coupon.id,
                          couponName: coupon.name,
                          couponPrice: coupon.price,
                          status: 0,
                          createdAt: moment().format('X')
                        }).exec(function (mcErr, mc) {

                        });
                      }
                    });
                  }
                  //网页注册赠送积分
                  var member_reg_score = sails.config.system.ShopConfig.member_reg_score || 0;
                  if (member_reg_score > 0) {
                    Shop_member.update(member.id, {score: member.score + member_reg_score}).exec(function (mscoreErr, mscore) {
                      if (mscore.length > 0) {
                        //将cookies购物车数据同步到数据库
                        Shop_member.findOne(mscore[0].id).exec(function (findErr, findObj) {
                          Shop_member_cart.updateCookieCartDataToDb(req, res, findObj, function () {
                            return res.json({code: 0, msg: '注册成功'});
                          });
                        });
                        Shop_member_score_log.create({
                          memberId: member.id,
                          oldScore: member.score,
                          newScore: member.score + member_reg_score,
                          diffScore: member_reg_score,
                          note: '注册会员赠送',
                          createdBy: 0,
                          createdAt: moment().format('X')
                        }).exec(function (logErr, log) {

                        });
                      }
                    });
                  } else {
                    //将cookies购物车数据同步到数据库
                    Shop_member_cart.updateCookieCartDataToDb(req, res, member, function () {
                      return res.json({code: 0, msg: '注册成功'});
                    });
                  }
                } else {
                  return res.json({code: 3, msg: '注册失败，请重试'});
                }
              });


            } else {
              return res.json({code: 3, msg: '注册失败，请重试'});
            }
          });
        });
      } else {
        return res.json({code: 1, msg: '手机校验码不正确，请重新获取'});
      }
    });
  },
  getSmscode: function (req, res) {
    var mobile = req.body.mobile || '';
    var vercode = req.body.vercode || '';
    var type = req.body.type || '';
    var sms = '';
    var tmp = sails.config.system.SmsConfig.sms_reg_template;
    if (type == 'join') {
      sms = '注册验证';
    } else if (type == 'login') {
      tmp = sails.config.system.SmsConfig.sms_login_template;
      sms = '登录验证';
    } else if (type == 'check') {
      tmp = sails.config.system.SmsConfig.sms_check_template;
      sms = '身份验证';
    } else if (type == 'password') {
      tmp = sails.config.system.SmsConfig.sms_password_template;
      sms = '变更验证';
    }
    var publicCaptcha = req.session.publicCaptcha || '';
    var code = StringUtil.randomNum(6);
    if (vercode == publicCaptcha) {
      if (type == 'login') {
        Shop_member_account.findOne({
          login_name: mobile
        }).exec(function (em, om) {
          if (om) {
            SmsService.sendVercode(mobile, {
              code: code,
              product: sails.config.system.SiteConfig.site_name || 'SunShop'
            }, tmp, function (result) {
              if (result) {
                RedisService.set('sms_vercode_' + mobile, code, 60 * 5, function (e, o) {
                  if (!e) {
                    Sms_log.create({mobile: mobile, code: code, sms: sms}).exec(function (e1, o1) {
                    });
                    return res.json({code: 0, msg: '短信发送成功，请在5分钟之内进行验证'});
                  } else {
                    return res.json({code: 2, msg: '短信未发送成功，请重试'});
                  }
                });
              } else {
                return res.json({code: 2, msg: '短信未发送成功，请重试'});
              }
            });
          } else {
            return res.json({code: 3, msg: '用户不存在，请先注册'});
          }
        });
      }
      if (type == 'join') {
        Shop_member_account.findOne({
          login_name: mobile
        }).exec(function (em, om) {
          if (om) {
            return res.json({code: 3, msg: '用户已存在，请直接登陆'});
          } else {
            SmsService.sendVercode(mobile, {
              code: code,
              product: sails.config.system.SiteConfig.site_name || 'SunShop'
            }, tmp, function (result) {
              if (result) {
                RedisService.set('sms_vercode_' + mobile, code, 60 * 5, function (e, o) {
                  if (!e) {
                    Sms_log.create({mobile: mobile, code: code, sms: sms}).exec(function (e1, o1) {
                    });
                    return res.json({code: 0, msg: '短信发送成功，请在5分钟之内进行验证'});
                  } else {
                    return res.json({code: 2, msg: '短信未发送成功，请重试'});
                  }
                });
              } else {
                return res.json({code: 2, msg: '短信未发送成功，请重试'});
              }
            });
          }
        });
      }
    } else {
      return res.json({code: 1, msg: '验证码不正确'});
    }
  },
  getSmscodeMember: function (req, res) {
    var mobile = req.body.mobile || '';
    var type = req.body.type || '';
    var sms = '';
    var member = req.session.member;
    //return res.json({code: 0, msg: '短信发送成功，请在5分钟之内进行验证'});
    if (member && member.memberId > 0) {
      var tmp = sails.config.system.SmsConfig.sms_reg_template;
      if (type == 'join') {
        sms = '注册验证';
      } else if (type == 'login') {
        tmp = sails.config.system.SmsConfig.sms_login_template;
        sms = '登录验证';
      } else if (type == 'check') {
        tmp = sails.config.system.SmsConfig.sms_check_template;
        sms = '身份验证';
      } else if (type == 'password') {
        tmp = sails.config.system.SmsConfig.sms_password_template;
        sms = '变更验证';
      }
      var code = StringUtil.randomNum(6);
      Shop_member.findOne(member.memberId).exec(function (em, om) {
        SmsService.sendVercode(om.mobile || '', {
          code: code,
          product: sails.config.system.SiteConfig.site_name || 'SunShop'
        }, tmp, function (result) {
          if (result) {
            RedisService.set('sms_vercode_' + om.mobile || '', code, 60 * 5, function (e, o) {
              if (!e) {
                Sms_log.create({mobile: om.mobile || '', code: code, sms: sms}).exec(function (e1, o1) {
                });
                return res.json({code: 0, msg: '短信发送成功，请在5分钟之内进行验证'});
              } else {
                return res.json({code: 2, msg: '短信未发送成功，请重试'});
              }
            });
          } else {
            return res.json({code: 2, msg: '短信未发送成功，请重试'});
          }
        });
      });
    } else {
      return res.json({code: 1, msg: '用户尚未登录'});
    }
  },
  getSmscodeMobile: function (req, res) {
    var mobile = req.body.mobile || '';
    var type = req.body.type || '';
    var sms = '';
    var member = req.session.member;
    //return res.json({code: 0, msg: '短信发送成功，请在5分钟之内进行验证'});
    if (member && member.memberId > 0) {
      var tmp = sails.config.system.SmsConfig.sms_reg_template;
      if (type == 'join') {
        sms = '注册验证';
      } else if (type == 'login') {
        tmp = sails.config.system.SmsConfig.sms_login_template;
        sms = '登录验证';
      } else if (type == 'check') {
        tmp = sails.config.system.SmsConfig.sms_check_template;
        sms = '身份验证';
      } else if (type == 'password') {
        tmp = sails.config.system.SmsConfig.sms_password_template;
        sms = '变更验证';
      }
      var code = StringUtil.randomNum(6);
      SmsService.sendVercode(mobile || '', {
        code: code,
        product: sails.config.system.SiteConfig.site_name || 'SunShop'
      }, tmp, function (result) {
        if (result) {
          RedisService.set('sms_vercode_' + mobile || '', code, 60 * 5, function (e, o) {
            if (!e) {
              Sms_log.create({mobile: mobile || '', code: code, sms: sms}).exec(function (e1, o1) {
              });
              return res.json({code: 0, msg: '短信发送成功，请在5分钟之内进行验证'});
            } else {
              return res.json({code: 2, msg: '短信未发送成功，请重试'});
            }
          });
        } else {
          return res.json({code: 2, msg: '短信未发送成功，请重试'});
        }
      });
    } else {
      return res.json({code: 1, msg: '用户尚未登录'});
    }
  },
  checkLoginname: function (req, res) {
    var id = req.params.id;
    Shop_member_account.findOne({login_name: id}).exec(function (err, obj) {
      if (obj)return res.json({code: 1, msg: '帐号已存在'});
      return res.json({code: 0, msg: ''});
    });
  },
  captcha: function (req, res) {
    if (req.url == '/favicon.ico')return res.end('');
    var txt = '' + parseInt(Math.random() * 9000 + 1000);
    var p = new captchapng(80, 30, txt); // width,height,numeric captcha
    p.color(0, 0, 0, 0);  // First color: background (red, green, blue, alpha)
    p.color(80, 80, 80, 255); // Second color: paint (red, green, blue, alpha)

    var img = p.getBase64();
    var imgbase64 = new Buffer(img, 'base64');
    req.session.publicCaptcha = txt;
    res.writeHead(200, {
      'Content-Type': 'image/png'
    });
    res.end(imgbase64);
  },
  logout: function (req, res) {
    var member = req.session.member;
    if (member) {
      req.session.destroy();
      res.redirect('/');
    } else {
      res.redirect('/');
    }
  },
  oauthWeixin: function (req, res) {
    var sn = StringUtil.getUuid(6, 10);
    RedisService.set('oauthWeixin_' + sn, JSON.stringify({loginStatus: false}), 10 * 60, function (err, reply) {
      return res.json({code: 0, msg: '', sn: sn});
    });
  },
  oauthWeixinStatus: function (req, res) {
    var sn = req.params.id;
    RedisService.get('oauthWeixin_' + sn, function (e, o) {
      if (e || !o)return res.json({code: 1});
      var user = JSON.parse(o);
      if (!user.loginStatus)return res.json({code: 1});
      var openid = user.openid;
      Shop_member_bind.findOne({bind_openid: openid}).exec(function (bindErr1, bind1) {
        if (bind1) {
          //如果存在微信商城帐号
          req.session.member = {
            memberId: bind1.memberId,
            nickname: bind1.bind_nickname,
            login_name: openid,
            loginIp: StringUtil.getIp(req),
            loginAt: moment().format('X'),
            loginWx: true,
            binded: bind1.binded,
            openid: openid
          };
          Shop_member.findOne(bind1.memberId).exec(function (findErr, findObj) {
            Shop_member_cart.updateCookieCartDataToDb(req, res, findObj, function () {
              return res.json({code: 0});
            });
          });
        } else {
          //如果不存在微信商城帐号，则新注册帐号(前提是微信支付和微信帐号、菜单都配置好)
          if (sails.config.system.ShopConfig.pay_wxpay) {
            async.waterfall([
              function (done) {
                Wx_config.findOne({appid: sails.config.system.ShopConfig.pay_wxpay_info.wxpay_appid}).exec(function (e, o) {
                  if (o) {
                    return done(null, o);
                  }
                  return done('error', {id: 0});
                });
              },
              function (conf, done) {
                Wx_user.count({openid: openid, wxid: conf.id}).exec(function (err, c) {
                  if (!err && c > 0) {
                    //若微信表存在数据,则更新
                    user.nickname = emoji.unifiedToHTML(user.nickname);
                    Wx_user.update({openid: openid, wxid: conf.id}, user).exec(function (e3, o3) {
                      return done(null, o3[0]);
                    });
                  } else {
                    user.wxid = conf.id;
                    user.subscribe = 0;
                    user.nickname = emoji.unifiedToHTML(user.nickname);
                    Wx_user.create(user).exec(function (e3, o) {
                      return done(null, o);
                    });

                  }
                });
              },
              function (wxuser, done) {
                //是否开启自动创建商城帐号
                Shop_member_bind.findOne({bind_openid: openid}).exec(function (bindErr, bind) {
                  if (!bind) {
                    //如果帐号绑定表数据不存在，则创建
                    Shop_member.create({
                      nickname: wxuser.nickname,
                      headimgurl: wxuser.headimgurl || '',
                      sex: wxuser.sex || 0,
                      reg_ip: StringUtil.getIp(req),
                      reg_time: moment().format('X'),
                      reg_source: 'oauth_weixin'
                    }).exec(function (mmbErr, mmb) {
                      Shop_member_bind.create({
                        memberId: mmb.id,
                        bind_type: 'weixin',
                        bind_openid: openid,
                        bind_nickname: wxuser.nickname,
                        disabled: false,
                        createdAt: moment().format('X')
                      }).exec(function (bcErr, bc) {
                        bc.jiSuan = true;
                        return done(null, bc);
                      });
                    });
                  } else {
                    Shop_member_bind.update({bind_openid: openid}, {disabled: false}).exec(function (bcErr2, bc2) {
                      //如果是取消关注重新关注的，则不进行积分优惠券计算
                      bc.jiSuan = false;
                      return done(null, bind);

                    });
                  }
                });
              }
              , function (bind, done) {
                if (bind.jiSuan == false)
                  done(null, bind);
                Shop_member.findOne(bind.memberId).exec(function (errmmb, mmb) {
                  var member_reg_score = sails.config.system.ShopConfig.member_reg_score || 0;
                  if (member_reg_score > 0) {
                    Shop_member.update(mmb.id, {score: mmb.score + member_reg_score}).exec(function (mscoreErr, mscore) {
                      Shop_member_score_log.create({
                        memberId: mmb.id,
                        oldScore: mmb.score,
                        newScore: mmb.score + member_reg_score,
                        diffScore: member_reg_score,
                        note: '微信信任登录注册赠送',
                        createdBy: 0,
                        createdAt: moment().format('X')
                      }).exec(function (logErr, log) {
                        return done(null, bind);
                      });
                    });
                  } else
                    return done(null, bind);
                });
              }, function (bind, done) {
                if (bind.jiSuan == false)
                  done(null, bind);
                //注册赠送优惠券
                if (sails.config.system.ShopConfig.member_reg_coupon > 0) {
                  Shop_sales_coupon.findOne(sails.config.system.ShopConfig.member_reg_coupon).exec(function (couponErr, coupon) {
                    if (coupon.disabled == false && coupon.maxNum > coupon.hasNum) {
                      Shop_member_coupon.create({
                        memberId: bind.memberId,
                        couponId: coupon.id,
                        couponName: coupon.name,
                        couponPrice: coupon.price,
                        status: 0,
                        createdAt: moment().format('X')
                      }).exec(function (mcErr, mc) {
                        return done(null, bind);
                      });
                    } else {
                      return done(null, bind);
                    }
                  });
                } else {
                  return done(null, bind);
                }
              }
            ], function (e, bind) {
              req.session.member = {
                memberId: bind.memberId,
                nickname: bind.bind_nickname,
                login_name: openid,
                loginIp: StringUtil.getIp(req),
                loginAt: moment().format('X'),
                loginWx: true,
                binded: bind.binded,
                openid: openid
              };
              Shop_member.findOne(bind.memberId).exec(function (findErr, findObj) {
                Shop_member_cart.updateCookieCartDataToDb(req, res, findObj, function () {
                  return res.json({code: 0});
                });
              });
            });
          } else {
            return res.json({code: 1});
          }
        }
      });
    });
  }
};
