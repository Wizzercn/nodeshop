/**
 * Created by root on 11/5/15.
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
      size: 100,
      required: true
    },
    type: {
      type: 'string',
      size: 20
    },
    picurl: {
      type: 'string'
    },
    url: {
      type: 'string'
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
    class: {
      model: 'Cms_linkClass',
      index: true
    }
  }
};
