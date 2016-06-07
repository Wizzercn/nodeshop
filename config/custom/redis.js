/**
 * Created by root on 9/17/15.
 */
module.exports.redis = {
  host: process.env.REDIS_HOST||'127.0.0.1',
  port: 6379,
  auth_pass: process.env.REDIS_PASS||''
};
