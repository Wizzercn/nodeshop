/**
 * IndexController
 *
 * @description :: Server-side logic for managing indices
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
  index: function (req, res) {
    var userId=req.session.user.id;
    return res.view('private/index.ejs', {layout: 'layouts/private',user:req.session.user});

  }
};

