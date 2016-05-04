/**
 * Created by root on 11/5/15.
 */
module.exports = {
  index: function (req, res) {
    Cms_site.findOrCreate({id: 1}).exec(function (err, obj) {
      req.data.obj = obj;
      return res.view('private/cms/site/index', req.data);
    });
  },
  editDo: function (req, res) {
    var body = req.body;
    Cms_site.update({id: body.id}, body).exec(function (err, obj) {
      if (err)return res.json({code: 1, msg: sails.__('update.fail')});
      sails.config.system.SiteConfig=obj[0];
      return res.json({code: 0, msg: sails.__('update.ok')});
    });
  }
};
