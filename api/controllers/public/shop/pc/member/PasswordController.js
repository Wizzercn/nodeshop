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
      }
    }, function (err, result) {
      req.data.channelList = result.channelList || [];
      req.data.allClassList = result.allClassList || [];
      req.data.dbMember=result.dbMember||{};
      req.data.StringUtil = StringUtil;
      req.data.moment = moment;
      req.data.siteTitle='修改密码_'+req.data.siteTitle;
      if(result.dbMember&&!result.dbMember.mobile){
        return res.redirect('/member/mobile');
      }
      return res.view('public/shop/' + sails.config.system.ShopConfig.shop_templet + '/pc/member_password', req.data);

    });
  },
  save:function(req,res){
    var member = req.session.member;
    if (!member || member.memberId < 1) {
      return res.json({code: 1, msg: ''});
    }
    var newpassword=req.body.newpassword||'';
    var smscode=req.body.smscode||'';
    Shop_member.findOne(member.memberId).exec(function (e2, m) {
      RedisService.get('sms_vercode_' + m.mobile, function (e, o) {
        if (o && smscode == o.toString()) {
          Shop_member_account.find({memberId:member.memberId}).exec(function(el,list){
            var i=0;
            list.forEach(function(account){
              i++;
              var login_password=StringUtil.password(newpassword, account.login_name, account.createdAt);
              Shop_member_account.update(account,{login_password:login_password}).exec(function(ep,op){
                if(i==list.length){
                  return res.json({code: 0, msg: ''});
                }
              });
            });
          });

        } else {
          return res.json({code: 2, msg: ''});
        }
      });
    });
  }
};
