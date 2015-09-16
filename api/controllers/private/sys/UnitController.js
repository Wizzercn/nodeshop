/**
 * Created by root on 9/16/15.
 */
module.exports = {
  index: function (req, res) {
    var userId=req.session.user.id;
    return res.view('private/index.ejs', {layout: 'layouts/private',user:req.session.user});

  }
};
