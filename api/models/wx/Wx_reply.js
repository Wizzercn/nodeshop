/**
 * Created by root on 10/27/15.
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
    name: {
      type: 'string',
      required: true
    },
    type: {
      type: 'string',
      size: 10,
      required: true
    },
    msgtype: {
      type: 'string',
      size: 10,
      required: true
    },
    keyword: {
      type: 'string',
      size: 20,
      required: true
    },
    content: {
      type: 'string',
      required: true
    },
    createdBy: {
      type: 'integer'
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
