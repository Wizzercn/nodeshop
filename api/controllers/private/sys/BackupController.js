/**
 * Created by wizzer on 20/4/16.
 */
var moment = require('moment');
var mysqldump = require('mysqldump');
var fs = require('fs-extra');
module.exports = {
  index: function (req, res) {
    return res.view('private/sys/backup/index', req.data);
  },
  data: function (req, res) {
    var pageSize = parseInt(req.body.length);
    var start = parseInt(req.body.start);
    var page = start / pageSize + 1;
    var draw = parseInt(req.body.draw);
    var order = req.body.order || [];
    var columns = req.body.columns || [];
    var sort = {};
    var where = {};
    if (order.length > 0) {
      sort[columns[order[0].column].data] = order[0].dir;
    }
    Sys_backup.count(where).exec(function (err, count) {
      if (!err && count > 0) {
        Sys_backup.find(where)
          .sort(sort)
          .paginate({page: page, limit: pageSize})
          .exec(function (err, list) {
            return res.json({
              "draw": draw,
              "recordsTotal": pageSize,
              "recordsFiltered": count,
              "data": list
            });
          });
      } else {
        return res.json({
          "draw": draw,
          "recordsTotal": pageSize,
          "recordsFiltered": 0,
          "data": []
        });
      }
    });
  },
  bak: function (req, res) {
    var body = req.body;
    var type = body.type;
    if(type=='db'){
      var name=moment().format('YYYYMMDDHHmmss')+'.sql';
      var dir=sails.config.appPath+'/backup/db/';
      var path=dir+name;
      fs.ensureDir(dir, function(err) {
        if(err)
          return res.json({code:1,msg:JSON.stringify(err)});
        mysqldump({
          host: sails.config.mysql.host,
          user: sails.config.mysql.user,
          password:sails.config.mysql.password,
          database:sails.config.mysql.database,
          dest:path // destination file
        },function(err){
          if(err)
            return res.json({code:1,msg:JSON.stringify(err)});
          Sys_backup.create({type:type,path:path,name:name,createdBy:req.session.user.id,createdAt:moment().format('X')}).exec(function(e,o){
            return res.json({code:0,msg:'备份成功'});
          });
        });
      });

    }
  },
  delete: function (req, res) {
    var ids = req.params.id || req.body.ids;
    Sys_backup.destroy({id: ids}).exec(function (err) {
      if (err)
        return res.json({code: 1, msg: sails.__('delete.fail')});
      return res.json({code: 0, msg: sails.__('delete.ok')});

    });
  },
  down:function(req,res){
    var name=req.params.id||'';
    Sys_backup.findOne({name:name}).exec(function(err,obj){
      if(obj){
        return res.status(200).sendfile(obj.path);
      }else{
        return res.send(404,'not exist');
      }
    });
  }
};
