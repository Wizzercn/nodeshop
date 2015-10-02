// ParsleyConfig definition if not already set
window.ParsleyConfig = window.ParsleyConfig || {};
window.ParsleyConfig.i18n = window.ParsleyConfig.i18n || {};
(function($) {
  window.ParsleyConfig = $.extend(true, {}, window.ParsleyConfig, {
  validators: {
    //手机或者email的校验的自定义
    mobileemail: {
      fn: function(value) {
        var mobile = /^1[3|4|5|7|8][0-9]\d{8}$/;
        var email = /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))){2,6}$/i;
        return (mobile.test(value) || email.test(value));
      },
      priority: 32
    },
    mobile: {
      fn: function(value) {
        var mobile = /^1[3|4|5|7|8][0-9]\d{8}$/;
        return (mobile.test(value));
      },
      priority: 32
    },
    phone: {
      fn: function(value) {
        var phone = /^0\d{2,3}-\d{5,9}|0\d{2,3}-\d{5,9}$/;
        return (phone.test(value));
      },
      priority: 32
    },
    //特殊字符校验的自定义
    nospecial: {
      fn: function(value) {
        var myReg = /[~^@\/\'\\\"#$%&\^\*\?\(\),`\+;\[\]\{\}\|\.:：<>!！￥？（），。、]/;
        if (myReg.test(value))
          return false;
        return true;
      },
      priority: 32

    }
  },
  messages: {
    mobileemail: "请填写正确的手机号码/电子邮箱",
    mobile: "请填写正确的手机号码",
    phone: "请填写正确的固定电话",
    nospecial: "您输入的值不可包含特殊字符"
  }
});
}(window.jQuery || window.Zepto));
// Define then the messages
window.ParsleyConfig.i18n.zh_cn = $.extend(window.ParsleyConfig.i18n.zh_cn || {}, {
  defaultMessage: "不正确的值",
  type: {
    email:        "请输入一个有效的电子邮箱地址",
    url:          "请输入一个有效的链接",
    number:       "请输入正确的数字",
    integer:      "请输入正确的整数",
    digits:       "请输入正确的号码",
    alphanum:     "请输入字母或数字"
  },
  notblank:       "请输入值",
  required:       "必填项",
  pattern:        "格式不正确",
  min:            "输入值请大于或等于 %s",
  max:            "输入值请小于或等于 %s",
  range:          "输入值应该在 %s 到 %s 之间",
  minlength:      "请输入至少 %s 个字符",
  maxlength:      "请输入至多 %s 个字符",
  length:         "字符长度应该在 %s 到 %s 之间",
  mincheck:       "请至少选择 %s 个选项",
  maxcheck:       "请选择不超过 %s 个选项",
  check:          "请选择 %s 到 %s 个选项",
  equalto:        "输入值不同"
});
window.ParsleyConfig.i18n.zh_cn = $.extend(window.ParsleyConfig.i18n.zh_cn || {}, {
	  dateiso: "请输入正确格式的日期 (YYYY-MM-DD)."
	});
// If file is loaded after Parsley main file, auto-load locale
if ('undefined' !== typeof window.ParsleyValidator)
  window.ParsleyValidator.addCatalog('zh_cn', window.ParsleyConfig.i18n.zh_cn, true);
