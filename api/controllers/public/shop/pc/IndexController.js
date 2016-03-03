/**
 * Created by root on 3/2/16.
 */
module.exports = {
  index: function (req, res) {
    console.log('req.data::'+JSON.stringify(req.data));
    return res.view('public/shop/'+sails.config.system.ShopConfig.shop_templet+'/pc/index', req.data);
  }
};
