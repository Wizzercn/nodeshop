/**
 * Created by wizzer on 2016/5/23.
 */
var StringUtil = require('../../common/StringUtil');
var moment = require('moment');
var jwt = require('jwt-simple');
module.exports = {
  token: function (req, res) {
    try {
      var loginname = req.body.loginname || '';
      var password = req.body.password || '';
      Api_token.findOne({loginname: loginname}).exec(function (e, o) {
        if (e) {
          return res.json({code: 1, msg: 'loginname has error'});
        }
        if (o.disabled) {
          return res.json({code: 2, msg: 'loginname has disabled'});
        }
        if (StringUtil.password(password,loginname, o.createdAt) != o.password) {
          return res.json({code: 3, msg: 'password has error'});
        }
        var expires = moment().add(1,'days').valueOf();
        var token = jwt.encode(
          {
            iss: o.id,
            exp: expires
          },
          sails.config.system.MyConfig.jwtTokenSecret||''
        );
        return res.json({
          token : token,
          expires : expires,
          appid : o.id
        });
      });
    } catch (err) {
      return res.json({code: 4, msg: 'params error'});
    }
  }
};
