/**
 * Created by root on 9/16/15.
 */
module.exports = {
  index: function (req, res) {
    var data=req.data;
    return res.view('private/index.ejs',data);

  },
  add: function (req, res) {
    var data=req.data;
    return res.view('private/index.ejs',data);
  }
};
