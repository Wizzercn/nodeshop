/**
 * Created by root on 11/4/15.
 */
var moment = require('moment');
module.exports = {
  schema: true,
  autoCreatedAt: false,
  autoUpdatedAt: false,
  attributes: {
    id: {
      type: 'string',
      primaryKey: true,
      defaultsTo: function () {
        return 1;
      }
    },
    filename: {
      type: 'string'
    },
    src: {
      type: 'string'
    },
    url: {
      type: 'string'
    },
    l_url: {
      type: 'string'
    },
    m_url: {
      type: 'string'
    },
    s_url: {
      type: 'string'
    },
    width: {
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    height: {
      type: 'integer',
      defaultsTo: function () {
        return 0;
      }
    },
    watermark: {
      type: 'boolean',
      defaultsTo: function () {
        return false;
      }
    },
    updatedAt: {
      type: 'integer',
      defaultsTo: function () {
        return moment().format('X');
      }
    }
  }
};

