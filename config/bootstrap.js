/**
 * Bootstrap
 * (sails.config.bootstrap)
 *
 * An asynchronous bootstrap function that runs before your Sails app gets lifted.
 * This gives you an opportunity to set up your data model, run jobs, or perform some special logic.
 *
 * For more information on bootstrapping your app, check out:
 * http://sailsjs.org/#!/documentation/reference/sails.config/sails.config.bootstrap.html
 */

module.exports.bootstrap = function(cb) {
  // It's very important to trigger this callback method when you are finished
  // with the bootstrap!  (otherwise your server will never lift, since it's waiting on the bootstrap)
  Sys_config.find().exec(function(e,o){
    if(e)sails.log.warn('bootstrap.sys_config.err::'+JSON.stringify(e));
    if(o){
      o.forEach(function(c){
        if('system.AppName'== c.config_key){
          sails.config.system.AppName=c.config_val||'';
        }else if('system.AppShrotName'== c.config_key){
          sails.config.system.AppShrotName=c.config_val||'';
        }else if('system.AppDomain'== c.config_key){
          sails.config.system.AppDomain=c.config_val||'';
        }else if('system.AppCopyright'== c.config_key){
          sails.config.system.AppCopyright=c.config_val||'';
        }else{
          sails.config.system.MyConfig[c.config_key]=c.config_val||'';
        }
      });
    }
  });
  cb();
};
