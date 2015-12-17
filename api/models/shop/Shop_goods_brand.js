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
      type: 'integer',
      autoIncrement: true,
      primaryKey: true
    },
    name: {
      type: 'string',
      size: 100,
      required: true
    },
    note: {
      type: 'text'
    },
    alias: {
      type: 'string',
      size: 100
    },
    domain: {
      type: 'string'
    },
    picurl: {
      type: 'string'
    },
    location: {
      type: 'integer'
    }
  }
};
