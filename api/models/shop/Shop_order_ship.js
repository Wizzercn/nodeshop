/**
 * Created by root on 3/15/16.
 */
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
    bn: {
      type:'string',
      size:10
    },
    //物流单号
    name:{
      type: 'string',
      size:30
    }
  }
};
