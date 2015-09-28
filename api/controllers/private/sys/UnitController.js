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
    Sys_unit.query('select * from sys_unit where parentId = ? order by location asc,path asc', [parseInt(req.params.id)], function (err, objs) {
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
  }
};
