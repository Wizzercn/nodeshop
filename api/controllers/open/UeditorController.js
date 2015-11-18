/**
 * Created by root on 11/16/15.
 */
var fs = require('../../../node_modules/sails/node_modules/fs-extra');
module.exports = {
  index: function (req, res) {
    if (req.session.auth && !req.session.user.disabled) {
      var action = req.query.action;
      //加载配置文件
      fs.readFile(sails.config.appPath + '/assets/plugins/ueditor/node/config.json', 'utf8', function (err, config_txt) {
        var config = JSON.parse(config_txt);
        switch (action) {
          case 'config':
            return res.send(config_txt);
            break;
          case 'uploadimage':
            console.log('uploadimage:::' + config.imageAllowFiles);
            req.file('Filedata').upload({
              maxBytes: config.imageMaxSize
            }, function (err, uploadedFiles) {
              if (err)return res.json({state: sails.__('file.upload.err')});


            });
            break;
        }
      });
    } else {
      return res.json({state: sails.__('private.forbidden'), url: '', title: '', original: '', type: '', size: 0});
    }
  }
};
