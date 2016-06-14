/**
 * Created by wizzer on 2016/6/14.
 */
var StringUtil = require('../../common/StringUtil');
var moment = require('moment');
module.exports = {
  getArea: function (req, res) {
    try {
      var pid = req.body.pid;
      if(pid||StringUtil.getInt(pid)!=0){
          Shop_area.find({
            parentId: pid,
            disabled: false
          }).sort({location: "asc"}).sort({path: "asc"}).exec(function (err, list) {
            return res.json({code: 0, msg: 'success', data: list});
          });
      }else{
        Shop_area.find({
          parentId: 0,
          disabled: false
        }).sort({location: "asc"}).sort({path: "asc"}).exec(function (err, list) {
          return res.json({code: 0, msg: 'success', data: list});
        });
      }
    } catch (err) {
      return res.json({code: 2, msg: 'err:' + err});
    }
  }
};
