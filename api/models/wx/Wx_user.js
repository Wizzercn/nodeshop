/**
 * Created by root on 10/25/15.
 */
var moment = require('moment');
var emoji = require('emoji');
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
      index: true,
      unique: true,
      size: 50
    },
    nickname: {//用户的昵称
      type: 'string'
    },
    subscribe: {//值为0时，代表此用户没有关注该公众号，拉取不到其余信息
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    sex: {//值为1时是男性，值为2时是女性，值为0时是未知
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    city: {
      type: 'string',
      size: 20
    },
    province: {
      type: 'string',
      size: 20
    },
    country: {
      type: 'string',
      size: 20
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

  },
  getUser: function (wxid, api, user_list) {
    api.batchGetUsers(user_list, function (uerr, udata, ures) {
      if (udata) {
        sails.log.warn('udata::' + JSON.stringify(udata));
        udata.user_info_list.forEach(function (u) {
          if (u && u.subscribe == 1) {
            u.nickname = emoji.unifiedToHTML(u.nickname);
            u.wxid = wxid;
            u.createdAt = u.subscribe_time;
            Wx_user.create(u).exec(function (e, log) {
            });
          }
        });

      }
    });
  },
  getFollow: function (puling, api, num, wxid) {
    if (puling != '') {
      api.getFollowers(puling, function (err, data, res) {
        var total = data.total;
        var count = data.count;
        var next_openid = data.next_openid;
        if (total > 10000 + num) {
          Wx_user.getFollow(req, res, next_openid, count + num);
        }
        var i = 0;
        var user_list = [];
        data.data.openid.forEach(function (o) {
          i++;
          user_list.push(o);
          if (i % 100 == 0 || i == count) {
            Wx_user.getUser(wxid, api, user_list);
            user_list = [];
          }
        });

      });
    } else {
      api.getFollowers(function (err, data, res) {
        var total = data.total;
        var count = data.count;
        var next_openid = data.next_openid;
        if (total > 10000) {
          Wx_user.getFollow(req, res, next_openid, count);
        }
        var i = 0;
        var user_list = [];
        data.data.openid.forEach(function (o) {
          i++;
          user_list.push(o);
          if (i % 100 == 0 || i == count) {
            Wx_user.getUser(wxid, api, user_list);
            user_list = [];
          }
        });

      });
    }
  }
};
