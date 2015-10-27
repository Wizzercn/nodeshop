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
