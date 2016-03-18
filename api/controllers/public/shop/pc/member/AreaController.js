/**
 * Created by root on 3/17/16.
 */
var StringUtil = require('../../../../../common/StringUtil');
var moment = require('moment');
module.exports = {
  getArea: function (req, res) {
    var name = req.query.name;
    if(name){
      Shop_area.findOne({name:name}).exec(function(e,o){
        Shop_area.find({
          parentId: o.id,
          disabled: false
        }).sort({location: "asc"}).sort({path: "asc"}).exec(function (err, list) {
          return res.json({code: 0, msg: '', list: list});
        });
      });
    }else {
      Shop_area.find({
        parentId: 0,
        disabled: false
      }).sort({location: "asc"}).sort({path: "asc"}).exec(function (err, list) {
        return res.json({code: 0, msg: '', list: list});
      });
    }
  },
  saveAddr:function(req,res){
    var member=req.session.member;
    if(member&&member.memberId>0){
      var body=req.body;
      body.is_default=req.body.is_default=='true';
      body.memberId=member.memberId;
      if(body.is_default==true){
        Shop_member_addr.update({memberId:member.memberId},{is_default:false}).exec(function(e,o){
          Shop_member_addr.create(body).exec(function(e,o){
            return res.json({code:0,msg:''});
          });
        });
      }else {
        Shop_member_addr.create(body).exec(function(e,o){
          return res.json({code:0,msg:''});
        });
      }
    }else {
      return res.json({code:1,msg:''});
    }
  },
  listAddr:function(req,res){
    var member=req.session.member;
    if(member&&member.memberId>0){
      Shop_member_addr.find({memberId:member.memberId}).sort({createdAt:'desc'}).sort({is_default:'desc'}).exec(function(e,l){
        return res.json({code:0,msg:'',list:l});
      });
    }else {
      return res.json({code:1,msg:'',list:[]});
    }
  }
};
