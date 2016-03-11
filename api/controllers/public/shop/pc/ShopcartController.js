/**
 * Created by root on 3/10/16.
 */
var StringUtil = require('../../../../common/StringUtil');
var moment = require('moment');
module.exports = {
  cartNum:function(req,res){
    var member = req.session.member;
    if (member && member.memberId > 0) {
      Shop_member_cart.find({memberId:member.memberId}).sum('num').then(function(o){
        return res.json({code:0,msg:'',num:o[0].num});
      });
    }else {
      var num=0;
      var cookies=req.cookies;
      if(cookies){
        for(var key in cookies){
          if(key.indexOf('shop_cart_goods_')==0){
            var o=JSON.parse(cookies[key]);
            if(o.num)
            num+= o.num;
          }
        }
      }
      return res.json({code:0,msg:'',num:num});
    }
  },
  addGoods: function (req, res) {
    var goodsId = StringUtil.getInt(req.body.goodsId);
    var productId = StringUtil.getInt(req.body.productId);
    var num = StringUtil.getInt(req.body.num);
    if (num == 0)num = 1;
    var member = req.session.member;

    async.waterfall([function (cb) {
      Shop_goods.find({
        select: ['id', 'name', 'price', 'imgurl'],
        where: {disabled: false, id: goodsId}
      }).exec(function (e, o) {
        var obj = {};
        obj.goodsId = goodsId;
        obj.spec = '';
        obj.productId = 0;
        if (o && o.length > 0) {
          obj.name = o[0].name || '';
          obj.price = o[0].price || 0;
          obj.imgurl = o[0].imgurl || '';
        }
        cb(e, obj);
      });
    }, function (obj, cb) {
      if (productId > 0) {
        Shop_goods_products.find({
          select: ['id', 'spec', 'price'],
          where: {disabled: false, id: productId}
        }).exec(function (e, o) {
          if (o && o.length > 0) {
            obj.price = o[0].price || 0;
            obj.spec = o[0].spec || '';
            obj.productId = productId;
          }
          cb(e, obj);
        });
      } else {
        cb(null, obj);
      }
    }], function (err, cartObj) {
      //根据用户是否登录存储到不同位置
      if (member && member.memberId > 0) {
        //这里只提交了一个对象，所以不用做同步控制（回调嵌回调即可）不同于 Shop_member_cart.updateCookieCartDataToDb
        Shop_member_cart.findOne({memberId:member.memberId,productId:productId,goodsId:goodsId}).exec(function(e,o){
          if(o){
            cartObj.num = o.num + num;
            Shop_member_cart.update(o.id,cartObj).exec(function(e1,o1){});
          }else {
            cartObj.num=num;
            cartObj.memberId=member.memberId;
            Shop_member_cart.create(cartObj).exec(function(e2,o2){});
          }
          return res.json({code: 0, msg: ''});
        });
      } else {
        var cookieGoods = req.cookies['shop_cart_goods_' + goodsId + '_' + productId];
        console.log('cookieGoods:::' + cookieGoods);
        if (cookieGoods) {
          var obj = JSON.parse(cookieGoods);
          cartObj.num = obj.num + num;
          res.cookie('shop_cart_goods_' + goodsId + '_' + productId, JSON.stringify(cartObj), {
            maxAge: 1000 * 60 * 60 * 24 * 30,
            httpOnly: true,
            path: '/',
            secure: false
          });
        } else {
          cartObj.num=num;
          res.cookie('shop_cart_goods_' + goodsId + '_' + productId, JSON.stringify(cartObj), {
            maxAge: 1000 * 60 * 60 * 24 * 30,
            httpOnly: true,
            path: '/',
            secure: false
          });

        }
        return res.json({code: 0, msg: ''});
      }
    });

  },
  list: function (req, res) {
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
      }
    }, function (err, result) {
      req.data.channelList = result.channelList || [];
      req.data.allClassList = result.allClassList || [];
      req.data.StringUtil = StringUtil;
      req.data.moment = moment;
      req.data.siteTitle = '会员中心_' + req.data.siteTitle;
      return res.view('public/shop/' + sails.config.system.ShopConfig.shop_templet + '/pc/shopcart_list', req.data);

    });
  },
  save: function (req, res) {
    return res.end();
  }
};
