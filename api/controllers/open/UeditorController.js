/**
 * Created by root on 11/16/15.
 */
var fs=require('../../../node_modules/sails/node_modules/fs-extra');
module.exports = {
  index:function (req, res) {
    var action=req.query.action;
    console.log('action::'+action);
    fs.readFile(sails.config.appPath+'/assets/plugins/ueditor/node/config.json', 'utf8', function(err, data) {
      return res.json(data);
    })
  }
};
