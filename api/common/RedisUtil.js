/**
 * Created by root on 9/17/15.
 */
var redis = require("redis");
var client = redis.createClient(sails.config.redis.port, sails.config.redis.host);
client.on("error", function (err) {
  sails.log("Redis error::" + err);
});
module.exports = {
  set: function (key, val, time) {
    client.set(key, val, redis.print);
    if (time && time > 0) {
      client.expire(key, time);//单位:秒
    }
  },
  get: function (key) {
    client.get(key, function (err, reply) {
      sails.log('Redis get::'+reply.toString());
    });
  }
};
