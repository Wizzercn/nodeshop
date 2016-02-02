/**
 * Created by root on 2/1/16.
 */
var moment = require('moment');
module.exports = {
  index: function (req, res) {
    return res.view('private/shop/goods/goods/index', req.data);
  }
};
