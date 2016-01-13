/**
 * Created by root on 10/25/15.
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
    name: {//活动名称
      type: 'string',
      required: true
    },
    code: {//唯一标识
      type: 'string',
      required: true,
      unique:true,
      size:20
    },
    type: {//活动类型
      type: 'string',
      required: true
    },
    picurl: {//标题图
      type: 'string'
    },
    audiourl: {//标题图
      type: 'string'
    },
    note: {//活动简介
      type: 'string'
    },
    rule: {//活动规则
      type: 'string'
    },
    sendType : {//0:固定  1:随机
      type: 'integer'
    },
    joinType : {//0:all 1:新关注用户
      type: 'integer'
    },
    budget : {//预算
      type: 'integer'
    },
    hasMoney : {//预算
      type: 'integer'
    },
    money : {//金额
      type: 'integer'
    },
    moneyMin : {//金额
      type: 'integer'
    },
    moneyMax : {//金额
      type: 'integer'
    },
    startTime: {
      type:'integer',
      defaultsTo:function(){
        return 0;
      }
    },
    endTime: {
      type:'integer',
      defaultsTo:function(){
        return 0;
      }
    },
    disabled: {
      type: 'boolean',
      defaultsTo: function () {
        return false;
      }
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
    wxid: {
      model: 'Wx_config'
    }

  }
};
