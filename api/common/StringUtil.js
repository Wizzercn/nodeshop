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
  },
  randomString: function (len) {
    len = len || 6;
    var $chars = 'ABCDEFGHJKMNPQRSTWXYZabcdefhijkmnprstwxyz2345678';
    /****默认去掉了容易混淆的字符oOLl,9gq,Vv,Uu,I1****/
    var maxPos = $chars.length;
    var pwd = '';
    for (i = 0; i < len; i++) {
      pwd += $chars.charAt(Math.floor(Math.random() * maxPos));
    }
    return pwd;
  },
  randomInt:function(min,max){
    var Range = max - min;
    var Rand = Math.random();
    return(min + Math.round(Rand * Range));
  }
};
