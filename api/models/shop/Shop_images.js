/**
 * Created by root on 2/29/16.
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
    imgurl:{
      type:'string',
      size:255
    },
    goodsid: {
      model: 'Shop_goods',
      index:true
    }
  }
};
