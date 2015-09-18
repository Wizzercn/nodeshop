/**
 * IndexController
 *
 * @description :: Server-side logic for managing indices
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */
module.exports = {
  index: function (req, res) {
    var data=req.data;

    return res.view('private/index.ejs',data);

  }
};

