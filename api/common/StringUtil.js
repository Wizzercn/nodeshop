/**
 * Created by root on 10/1/15.
 */
module.exports = {
  getPath: function (num, n) {
    var str = num.toString();
    var len = str.length;
    while (len < n) {
      str = '0' + str;
      len++;
    }
    return str;
  }
};
