/**
 * Created by root on 3/23/16.
 */
var StringUtil = require('../../../../../common/StringUtil');
var moment = require('moment');
module.exports = {
  index: function (req, res) {
    var m = req.session.member;
    if (!m || m.memberId < 1) {
      return res.redirect('/login');
    }
    async.parallel({
      //获取cms栏目分类
      channelList: function (done) {
        Cms_channel.getChannel(function (list) {
          done(null, list);
        });
      },
      //获取所有商品分类
      allClassList: function (done) {
        Shop_goods_class.getAllClass(function (list) {
          done(null, list);
        });
      },
      dbMember: function (done) {
        Shop_member.findOne(m.memberId).populate('lv_id').exec(function (e, o) {
          done(null, o);
        });
      }
    }, function (err, result) {
      req.data.channelList = result.channelList || [];
      req.data.allClassList = result.allClassList || [];
      req.data.dbMember = result.dbMember || {};
      req.data.StringUtil = StringUtil;
      req.data.moment = moment;
      return res.view('public/shop/' + sails.config.system.ShopConfig.shop_templet + '/wap/member_profile', req.data);

    });
  },
  checkEmail: function (req, res) {
    var member = req.session.member;
    if (!member || member.memberId < 1) {
      return res.json({code: 1, msg: '登录失效'});
    }
    var email = req.body.email;
    Shop_member.findOne({id: {'!': member.memberId}, email: email}).exec(function (e, o) {
      if (o) {
        return res.json({code: 2, msg: ''});
      } else {
        return res.json({code: 0, msg: ''});
      }
    });
  },
  save: function (req, res) {
    var member = req.session.member;
    if (!member || member.memberId < 1) {
      return res.json({code: 1, msg: '登录失效'});
    }
    var wdate = req.body.wdate;
    var b_year = 0;
    var b_month = 0;
    var b_day = 0;
    if (wdate) {
      b_year = moment(wdate).format('YYYY');
      b_month = moment(wdate).format('MM');
      b_day = moment(wdate).format('DD');
    }
    if (req.body.email) {


      Shop_member.findOne({id: {'!': member.memberId}, email: req.body.email}).exec(function (e1, o1) {
        if (o1) {
          return res.json({code: 2, msg: ''});
        } else {
          Shop_member.update(member.memberId, {
            nickname: req.body.nickname, province: req.body.province,
            city: req.body.city,
            area: req.body.area,
            addr: req.body.addr,
            sex: req.body.sex,
            realname: req.body.realname,
            email: req.body.email,
            b_year: b_year,
            b_month: b_month,
            b_day: b_day
          }).exec(function (e2, o2) {
            sails.log.debug('e2:::' + e2);
            if (e2) {
              return res.json({code: 1, msg: ''});
            } else {
              member.nickname = req.body.nickname || '';
              req.session.member = member;
              return res.json({code: 0, msg: ''});
            }
          });
        }
      });

    } else {
      Shop_member.update(member.memberId, {
        nickname: req.body.nickname, province: req.body.province,
        city: req.body.city,
        area: req.body.area,
        addr: req.body.addr,
        sex: req.body.sex,
        realname: req.body.realname,
        email: req.body.email,
        b_year: b_year,
        b_month: b_month,
        b_day: b_day
      }).exec(function (e2, o2) {
        sails.log.debug('e2:::' + e2);
        if (e2) {
          return res.json({code: 1, msg: ''});
        } else {
          member.nickname = req.body.nickname || '';
          req.session.member = member;
          return res.json({code: 0, msg: ''});
        }
      });
    }
  }
};
