/**
 * Created by wizzer on 2016/5/23.
 */
var StringUtil = require('../../common/StringUtil');
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
    name:{
      type: 'string'
    },
    client_id: {
      type: 'string',
      unique: true,
      size: 100,
      required: true,
      maxLength: 100,
      index: true
    },
    client_secret: {
      type: 'string',
      required: true
    },
    createdAt: {
      type: 'integer',
      defaultsTo: function () {
        return moment().format('X');
      }
    },
    disabled: {
      type: 'boolean',
      defaultsTo: function () {
        return false;
      }
    }
  },
  getClient_id: function (cb) {
    var n = StringUtil.getUuid(20, 62);
    Api_token.findOne({client_id:n}).exec(function (e, o) {
      if (o) {
        Api_token.getClient_id(function (ss) {
          return cb(ss);
        });
      } else {
        return cb(n);
      }
    });
  },
  getClient_secret: function (cb) {
    var n = StringUtil.getUuid(32, 62);
    Api_token.findOne({client_secret:n}).exec(function (e, o) {
      if (o) {
        Api_token.getClient_secret(function (ss) {
          return cb(ss);
        });
      } else {
        return cb(n);
      }
    });
  }
};
