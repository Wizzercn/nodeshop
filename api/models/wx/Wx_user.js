/**
 * Created by root on 10/25/15.
 */
var moment = require('moment');
module.exports = {
  schema: true,
  autoCreatedAt: false,
  autoUpdatedAt: false,
  attributes: {
    id: {
      type: 'integer',
      autoIncrement: true,
      primaryKey: true
    },
    openid: {//用户的标识，对当前公众号唯一
      type: 'string',
      required: true,
      size:50
    },
    nickname: {//用户的昵称
      type: 'string'
    },
    subscribe:{//值为0时，代表此用户没有关注该公众号，拉取不到其余信息
      type:'integer',
      defaultsTo:function(){
        return 0;
      }
    },
    sex:{//值为1时是男性，值为2时是女性，值为0时是未知
      type:'integer',
      defaultsTo:function(){
        return 0;
      }
    },
    city: {
      type: 'string',
      size:20
    },
    province: {
      type: 'string',
      size:20
    },
    country: {
      type: 'string',
      size:20
    },
    headimgurl: {
      type: 'string'
    },
    createdAt: {
      type: 'integer',
      defaultsTo: function () {
        return moment().format('X');
      }
    },
    wxid: {
      model: 'Wx_config'
    }

  }
};
