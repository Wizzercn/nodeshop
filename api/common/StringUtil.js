/**
 * Created by root on 10/1/15.
 */
var md5 = require('md5');
module.exports = {
  /**
   * 计算树路径自动补0
   * @param num
   * @param n
   * @returns {*}
   */
  getPath: function (num, n) {
    var str = num.toString();
    var len = str.length;
    while (len < n) {
      str = '0' + str;
      len++;
    }
    return str;
  },
  /**
   * 取随机字符串
   * @param len
   * @returns {string}
   */
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
  /**
   * 取随机数
   * @param min
   * @param max
   * @returns {*}
   */
  randomInt: function (min, max) {
    var Range = max - min;
    var Rand = Math.random();
    return (min + Math.round(Rand * Range));
  },
  /**
   * 取5的倍数随机数
   * @param min
   * @param max
   * @returns {*}
   */
  randomInt5: function (min, max) {
    var s = [];
    for (var i = min; i <= max; i = i + 5) {
      s.push(i);
    }
    var Range = s.length - 1;
    var Rand = Math.random();
    var p = Math.round(Rand * Range);
    if (s[p]) {
      return (s[p]);
    } else {
      return (max);
    }
  },
  randomNum:function(num){
    var Num="";
    for(var i=0;i<num;i++)
    {
      Num+=Math.floor(Math.random()*10);
    }
    return Num;
  },
  password: function (password, loginname, createAt) {
    var p = md5(md5(password) + loginname + createAt);
    return 'w' + p.substring(0, p.length - 1);
  },
  getSn: function (num, n) {
    var len = num.toString().length;
    while (len < n) {
      num = "0" + num;
      len++;
    }
    return num;
  },
  getPrice:function(str){
    if(typeof str=='undefined'||str==''||str==null||str=='null'){
      return 0;
    }
    if(str.indexOf('.')>0){
      var s=str.substring(0,str.indexOf('.'));
      var p=str.substring(str.indexOf('.')+1);
      if(p.length>1){
        return parseInt(s+p.substring(0,2));
      }else if(p.length==1){
        return parseInt(s+p+'0');
      }else{
        return parseInt(s+'00');
      }
    }else{
      return parseInt(str+'00');
    }
  },
  setPrice:function(str){
    if(typeof str=='string'&&str.length>2){
      return str.substring(0,str.length-2)+'.'+str.substring(str.length-2);
    }
    if(typeof str=='number'){
      var s=str.toString();
      return s.substring(0,s.length-2)+'.'+s.substring(s.length-2);
    }
  },
  getInt:function(str){
    if(typeof str=='undefined'||str==''||str==null||str=='null'){
      return 0;
    }
    return parseInt(str);
  },
  arrSort:function(key,desc){
    return function(a,b){
      return desc ? ~~(a[key] < b[key]) : ~~(a[key] > b[key]);
    }
  }
};
