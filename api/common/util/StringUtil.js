/**
 * Created by root on 9/10/15.
 */
module.exports = {
  //获取客户端IP
  getClientAddress: function (req) {
    return (req.headers['x-forwarded-for'] || '').split(',')[0]
      || req.connection.remoteAddress;
  }
};
