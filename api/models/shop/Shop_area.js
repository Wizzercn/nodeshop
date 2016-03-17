/**
 * 资源菜单
 * Created by root on 9/10/15.
 */
//var uuid = require('node-uuid');
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
    parentId: {
      type: 'integer'
    },
    path: {
      type: 'string',
      size: 100,
      index:true
    },
    name: {
      type: 'string',
      size: 50,
      index: true
    },
    code: {
      type: 'string',
      size: 20
    },
    disabled: {
      type: 'boolean',
      defaultsTo: function () {
        return false;
      }
    },
    hasChildren: {
      type: 'boolean',
      defaultsTo: function () {
        return false;
      }
    },
    location: {
      type: 'integer',
      size: 11
    }
  }
};
