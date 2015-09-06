/**
 * 系统日志
 * Created by wizzer on 2015/9/6.
 */
module.exports = {
  schema: true,
  autoCreatedAt: false,
  autoUpdatedAt: false,
  attributes: {
    id: {
      type: 'integer',
      autoIncrement: true
    },
    type: {
      type: 'string',
      size: 100
    },
    op_id: {//操作人ID
      type: 'string',
      size: 50
    },
    op_name: {
      type: 'string',
      size: 50
    },
    createdAt:{
      type:'integer',
      defaultsTo:function(){
        return new Date().getTime();
      }
    },
    updatedAt:{
      type:'integer',
      defaultsTo:function(){
        return new Date().getTime();
      }
    }
  }
};
