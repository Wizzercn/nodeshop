/**
 * Created by root on 9/16/15.
 */
module.exports = {
  index: function (req, res) {
    Sys_unit.query('select * from sys_unit where length(path)=4 order by location asc,path asc', function (err, objs) {
      req.data.unit = objs;
      return res.view('private/sys/unit/index.ejs', req.data);
    });
  },
  child: function (req, res) {
    var id=req.params.id;
    if(!id)id='0';
    Sys_unit.query('select * from sys_unit where parentId = ? order by location asc,path asc', [parseInt(id)], function (err, objs) {
      req.data.unit = objs;
      return res.view('private/sys/unit/child.ejs', req.data);
    });
  },
  detail: function (req, res) {
    Sys_unit.findOne({id:req.params.id}).exec(function (err, obj) {
      req.data.moment=require("moment");
      req.data.obj = obj;
      return res.view('private/sys/unit/detail.ejs', req.data);
    });
  },
  tree:function(req,res){
    var pid=req.query.pid;
    if(!pid)pid='0';
    console.log('pid::'+pid);
    Sys_unit.query('select id,name as text,if(haschildren=1,\'true\',\'false\') AS children from sys_unit where parentId =? order by location asc,path asc', [parseInt(pid)], function (err, objs) {
       return res.json([
         {
           "id": 3,
           "text": "3333",
           "children": true
         },
         {
           "id": 1,
           "text": "系统管理",
           "children": true
         }
       ]);
    });
  },
  add:function(req,res){
    var pid=req.query.pid;
    if(pid){
      Sys_unit.findOne({id:parseInt(pid)}).exec(function (err, obj) {
        req.data.parentUnit = obj;
        return res.view('private/sys/unit/add', req.data);
      });
    }else{
      return res.view('private/sys/unit/add', req.data);
    }
  },
  addDo:function(req,res){
    var pid=req.body.pid;

  }
};
