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
    title: {
      type: 'string',
      required: true
    },
    disabled:{
      type:'boolean',
      defaultsTo: function (){ return false; }
    },
    createdBy:{
      type: 'integer'
    },
    createdAt:{
      type:'integer',
      defaultsTo:function(){
        return moment().format('X');
      }
    },
    channelId: {
      model: 'Cms_channel',
      index:true
    }
  }
};

