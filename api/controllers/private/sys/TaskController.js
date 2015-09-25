/**
 * Created by root on 9/23/15.
 */
module.exports = {
  index: function (req, res) {
    var data=req.data;
    return res.view('private/sys/task/index.ejs',data);

  }
};
