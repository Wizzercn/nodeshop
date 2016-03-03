/**
 * Created by root on 3/2/16.
 */
module.exports = {
  index: function (req, res) {
    console.log('req.data::' + JSON.stringify(req.data));
    var i = 0;
    async.parallel({
      channelList: function (done) {
        Cms_channel.getChannel(function (list) {
          done(null, list);
        });
      }
    }, function (err, result) {

      req.data.channelList = result.channelList || [];
      return res.view('public/shop/' + sails.config.system.ShopConfig.shop_templet + '/pc/index', req.data);
    });
  }
};
