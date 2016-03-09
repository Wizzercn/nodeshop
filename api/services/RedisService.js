/**
 * Created by root on 3/9/16.
 */
var redis = require("redis");
var client = redis.createClient(sails.config.redis);
var i=0;
i++;
console.log('redis i:::'+i);
client.on("error", function (err) {
  sails.log("Redis error::" + err);
});
module.exports = {
  set: function (key, val, time,cb) {
    client.set(key, val, redis.print);
    if (time && time > 0) {
      client.expire(key, time);//单位:秒
    }
    console.log('aaaaa');
    cb(val);
  },
  get: function (key) {
    client.get(key, function (err, reply) {
      sails.log('Redis get::'+reply.toString());
    });
  }
};
