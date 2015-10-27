/**
 * Created by root on 10/25/15.
 */
module.exports = {
  api: function (req, res) {
    var id = req.query.wxid;
    Wx_config.findOne(id).exec(function (err, conf) {
      if (err)return res.send(200, 'fail');
      if (req.body) {
        WeixinService.loop(req, function (data) {
          if (data.type = 'text') {//用户发送纯文本
            var msg = {toUserName: data.openid, fromUserName: conf.ghid, content: 'Node.js Test...'};
            WeixinService.sendTextMsg(res, msg);//向用户回复消息
            //var articles = [];
            //articles[0] = {
            //  title : "PHP依赖管理工具Composer入门",
            //  description : "PHP依赖管理工具Composer入门",
            //  picUrl : "http://weizhifeng.net/images/tech/composer.png",
            //  url : "http://weizhifeng.net/manage-php-dependency-with-composer.html"
            //};
            //
            //articles[1] = {
            //  title : "八月西湖",
            //  description : "八月西湖",
            //  picUrl : "http://weizhifeng.net/images/poem/bayuexihu.jpg",
            //  url : "http://weizhifeng.net/bayuexihu.html"
            //};
            //
            //articles[2] = {
            //  title : "「翻译」Redis协议",
            //  description : "「翻译」Redis协议",
            //  picUrl : "http://weizhifeng.net/images/tech/redis.png",
            //  url : "http://weizhifeng.net/redis-protocol.html"
            //};
            //var msg = {
            //  toUserName: data.openid, fromUserName: conf.ghid,
            //  articles : articles
            //};
            //WeixinService.sendNewsMsg(res, msg);//向用户回复消息

          }
        });
      }
      //签名
      if (WeixinService.checkSignature(req, conf.token)) {
        res.send(200, req.query.echostr);
      } else {
        res.send(200, 'fail');
      }
    });
  }
};
