/**
 * Created by root on 9/16/15.
 */
module.exports = function(req, res, next) {
  var roleCodes=req.session.roleCodes;
  if (roleCodes&&roleCodes.indexOf('sysadmin')>-1) {
    return next();
  } else {
    return res.forbidden(sails.__('private.forbidden'));
  }
};
