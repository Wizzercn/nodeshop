/**
 * Created by root on 11/9/15.
 */
var fs = require('fs-extra');
var moment = require("moment");
module.exports = {
  /**
   * 只允许上传图片，并验证是否已登陆
   * @param req
   * @param res
   */
  image: function (req, res) {
    if (req.session.auth && !req.session.user.disabled) {

      req.file('Filedata').upload({
        maxBytes: 2048000
      }, function (err, uploadedFiles) {
        if (err) {
          return res.json({code: 2, msg: sails.__('file.upload.err') + ' ' + err});
        } else {
          var type = uploadedFiles[0].type;
          var fd = uploadedFiles[0].fd;
          var filename = uploadedFiles[0].filename;
          if (uploadedFiles.length === 0) {
            return res.json({code: 2, msg: sails.__('file.upload.err')});
          } else if (type.indexOf('image') != 0) {
            return res.json({code: 3, msg: sails.__('file.upload.only.image')});

          } else {
            var file = fd.substring(fd.lastIndexOf('/'));
            var newPath = sails.config.system.AppBase + sails.config.system.UploadPath + "/image/" + moment().format("YYYYMMDD") + file;

            fs.copy(fd, sails.config.appPath + newPath, function (err) {
              if (err)return res.json({code: 2, msg: sails.__('file.upload.err') + ' ' + err});
              return res.json({code: 0, msg: sails.__('file.upload.ok'), filename: filename, path: newPath});
            })
          }
        }
      });

    } else {
      return res.json({code: 1, msg: sails.__('private.forbidden')});
    }

  },
  file: function (req, res) {
    if (req.session.auth && !req.session.user.disabled) {

      req.file('Filedata').upload({
        maxBytes: 204800000
      }, function (err, uploadedFiles) {
        if (err) {
          return res.json({code: 2, msg: sails.__('file.upload.err') + ' ' + err});
        } else {
          var type = uploadedFiles[0].type;
          var fd = uploadedFiles[0].fd;
          var filename = uploadedFiles[0].filename;
          if (uploadedFiles.length === 0) {
            return res.json({code: 2, msg: sails.__('file.upload.err')});
          } else {
            sails.log.verbose('filename:'+filename+' type:'+type);
            var file = fd.substring(fd.lastIndexOf('/'));
            var dirname='file';
            if(type.indexOf('audio')>-1){
              dirname='audio';
            }else if(type.indexOf('video')>-1){
              dirname='video';
            }
            var newPath = sails.config.system.AppBase + sails.config.system.UploadPath + "/"+dirname+"/" + moment().format("YYYYMMDD") + file;

            fs.copy(fd, sails.config.appPath + newPath, function (err) {
              if (err)return res.json({code: 2, msg: sails.__('file.upload.err') + ' ' + err});
              return res.json({code: 0, msg: sails.__('file.upload.ok'), filename: filename, path: newPath});
            })
          }
        }
      });

    } else {
      return res.json({code: 1, msg: sails.__('private.forbidden')});
    }

  }
};
