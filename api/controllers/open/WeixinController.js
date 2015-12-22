/**
 * Created by root on 10/25/15.
 */
module.exports = {
  api: function (req, res) {
    var id = req.params.id;
    Wx_config.findOne(id).exec(function (err, conf) {
      if (err)return res.send(200, 'fail');
      if (req.body) {
        WeixinService.loop(req, function (data) {
          if (data.type == 'text') {//用户发送纯文本
            var txt = data.txt;
            Wx_reply.findOne({wxid: id, type: 'keyword', keyword: txt}).exec(function (err, obj) {
              if (obj) {
                Wx_reply.sendMsg(req, res, obj, conf.ghid, data);
              } else {//查找默认回复内容
                Wx_reply.findOne({wxid: id, type: 'keyword', keyword: 'default'}).exec(function (err2, obj2) {
                  if (obj) {
                    Wx_reply.sendMsg(req, res, obj2, conf.ghid, data);
                  } else {
                    return res.send(200, req.query.echostr);
                  }
                });
              }
            });
          } else if (data.type == 'event') {
            if (data.event == 'subscribe') {//关注事件
              Wx_reply.findOne({wxid: id, type: 'follow'}).exec(function (err, obj) {
                if (obj) {
                  if (obj.msgtype == 'txt') {
                    Wx_txt.findOne({id: obj.content}).exec(function (e, o) {
                      if (o) {
                        var msg = {toUserName: data.openid, fromUserName: conf.ghid, content: o.content};
                        WeixinService.sendTextMsg(res, msg);//向用户回复消息
                      } else {
                        return res.send(200, req.query.echostr);
                      }
                    });
                  } else if (obj.msgtype == 'news') {
                    var sql = 'SELECT * FROM wx_news WHERE id IN (' + obj.content + ') ORDER BY INSTR(\'' + obj.content + '\',id)';
                    //按id数组顺序排序
                    Wx_news.query(sql, [], function (e, o) {
                      if (o.length > 0) {
                        var msg = {
                          toUserName: data.openid, fromUserName: conf.ghid,
                          articles: o
                        };
                        WeixinService.sendNewsMsg(res, msg);//向用户回复消息
                      } else {
                        return res.send(200, req.query.echostr);
                      }
                    });
                  } else {
                    return res.send(200, req.query.echostr);
                  }
                }
              });
            }
            if (data.event == 'CLICK') {
              Wx_reply.findOne({wxid: id, type: 'keyword', keyword: data.eventKey}).exec(function (err, obj) {
                if (obj) {
                  Wx_reply.sendMsg(req, res, obj, conf.ghid, data);
                } else {
                  return res.send(200, req.query.echostr);
                }
              });

            } else {
              return res.send(200, req.query.echostr);
            }
          } else {
            return res.send(200, req.query.echostr);
          }
        });
      } else {
        //签名
        if (WeixinService.checkSignature(req, conf.token)) {
          return res.send(200, req.query.echostr);
        } else {
          sails.log.error('weixin checkSignature fail');
          return res.send(200, 'fail');
        }
      }

    });
  },
  test:function(req,res){
    return res.view('test',{layout: 'layouts/layout'});
  }
};
