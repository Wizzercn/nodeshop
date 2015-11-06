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
    content: {
      type: 'text'
    },
    article: {
      model: 'Cms_article',
      index: true
    }
  }
};
