/**
 * Created by root on 11/5/15.
 */
module.exports = {
  /**
   * 菜单管理首页
   * @param req
   * @param res
   */
  index: function (req, res) {
    Sys_menu.find().where({parentId: 0}).sort('location asc').sort('path asc').exec(function (err, objs) {
      req.data.unit = objs;
      return res.view('private/sys/menu/index', req.data);
    });
  }
};
