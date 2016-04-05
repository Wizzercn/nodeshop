/**
 * Created by root on 3/23/16.
 */
var StringUtil = require('../../../../../common/StringUtil');
var moment = require('moment');
module.exports = {
  index: function (req, res) {
    var m=req.session.member;
    if(!m|| m.memberId<1){
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
      dbMember:function(done){
        Shop_member.findOne(m.memberId).populate('lv_id').exec(function(e,o){
          done(null,o);
        });
      },
      couponList:function(done){
        Shop_sales_coupon.find({disabled:false,is_score:true}).sort({score:'asc'}).exec(function(e,o){
          done(null,o);
        });
      }
    }, function (err, result) {
      req.data.channelList = result.channelList || [];
      req.data.allClassList = result.allClassList || [];
      req.data.couponList = result.couponList || [];
      req.data.dbMember=result.dbMember||{};
      req.data.StringUtil = StringUtil;
      req.data.moment = moment;
      req.data.siteTitle='积分明细_'+req.data.siteTitle;
      return res.view('public/shop/' + sails.config.system.ShopConfig.shop_templet + '/wap/member_score', req.data);

    });
  },
  list: function (req, res) {
    var member = req.session.member;
    if (!member || member.memberId < 1) {
      return res.json({code: 1, msg: '登录失效'});
    }
    var pageSize = 10;
    var start = StringUtil.getInt(req.query.start);
    var sort = {createdAt: 'desc'};
    var where = {memberId: member.memberId};
    Shop_member_score_log.getPageList(pageSize, start, where, sort, function (obj) {
      return res.json({code: 0, msg: '', data: obj});
    });
  },
  coupon: function (req, res) {
    var member = req.session.member;
    if (!member || member.memberId < 1) {
      return res.json({code: 1, msg: ''});
    }
    var id = StringUtil.getInt(req.query.id);
    Shop_sales_coupon.findOne({id:id,disabled:false,is_score:true}).exec(function(e,o){
      return res.json({code: 0, msg: '', data: o});
    });
  },
  saveCoupon:function(req,res){
    var m = req.session.member;
    if (!m || m.memberId < 1) {
      return res.json({code: 1, msg: '登录失效'});
    }
    var id = StringUtil.getInt(req.query.id);
    Shop_sales_coupon.findOne({id:id,disabled:false,is_score:true}).exec(function(e1,coupon){
      Shop_member.findOne(m.memberId).exec(function(e2,member){
        if(e1||e2){
          return res.json({code: 2, msg: '系统异常'});
        }else {
          if(coupon.maxNum-coupon.hasNum<1){
            return res.json({code: 3, msg: '数量不足'});
          }
          if(member.score-coupon.score<0){
            return res.json({code: 4, msg: '积分不足'});
          }
          Shop_member_coupon.create({
            memberId: member.id,
            couponId:id,
            couponName:coupon.name,
            couponPrice:coupon.price,
            status:0,
            createdAt:moment().format('X')
          }).exec(function(e3,o3){
            Shop_member_score_log.create({
              memberId: member.id,
              oldScore:member.score,
              newScore:member.score-coupon.score,
              diffScore:coupon.score,
              note:'兑换优惠券:'+coupon.name,
              createdAt:moment().format('X')
            }).exec(function(e4,o4){
              Shop_sales_coupon.update(id,{hasNum:coupon.hasNum+1}).exec(function(e5,o5){
                Shop_member.update(member.id,{score:member.score-coupon.score}).exec(function(e6,o6){
                  return res.json({code: 0, msg: ''});
                });
              });

            });
          });

        }
      });
    });
  }
};
