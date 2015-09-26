/**
 * Created by root on 9/16/15.
 */
module.exports = {
  index: function (req, res) {
    var data = req.data;
    Sys_unit.query('select * from sys_unit where length(path)=4 order by location asc,path asc',function (err, objs) {
      var unit=[];
      if(objs){
        unit=objs;
      }
      data.unit=unit;
      return res.view('private/sys/unit/index.ejs', data);
    });

  },
  child: function (req, res) {
    var data = req.data;
    Sys_unit.query('select * from sys_unit where parentId = ? order by location asc,path asc',[parseInt(req.params.id)],function (err, objs) {
      var unit=[];
      if(objs){
        unit=objs;
      }
      console.log('err:::'+JSON.stringify(err));
      console.log('unit:::'+JSON.stringify(unit));
      data.unit=unit;
      return res.view('private/sys/unit/child.ejs', data);
    });
  }
};
