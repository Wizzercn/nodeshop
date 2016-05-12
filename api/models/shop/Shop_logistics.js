/**
* Created by root on 3/15/16.
*/
var StringUtil = require('../../common/StringUtil');
var moment = require('moment');
module.exports = {
  schema: true,
  autoCreatedAt: false,
  autoUpdatedAt: false,
  attributes: {
    //物流公司id
    id: {
      type: 'integer',
      autoIncrement: true,
      primaryKey: true
    },
    //物流公司编码
    bn: {
      type: 'string',
      size:50,
    },
    //物流公司名称
    name:{
      type: 'string',
      size: 50
    },
  }
}
