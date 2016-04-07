/**
 * Created by root on 3/17/16.
 */
var StringUtil = require('../../../../../common/StringUtil');
var moment = require('moment');
module.exports = {
  getArea: function (req, res) {
    var name = req.query.name;
    if (name) {
      Shop_area.findOne({name: name}).exec(function (e, o) {
        Shop_area.find({
          parentId: o.id,
          disabled: false
        }).sort({location: "asc"}).sort({path: "asc"}).exec(function (err, list) {
          return res.json({code: 0, msg: '', list: list});
        });
      });
    } else {
      Shop_area.find({
        parentId: 0,
        disabled: false
      }).sort({location: "asc"}).sort({path: "asc"}).exec(function (err, list) {
        return res.json({code: 0, msg: '', list: list});
      });
    }
  },
  saveAddr: function (req, res) {
    var member = req.session.member;
    if (member && member.memberId > 0) {
      var body = req.body;
      body.memberId = member.memberId;
      body.is_default=true;
        Shop_member_addr.update({memberId: member.memberId}, {is_default: false}).exec(function (e1, o1) {
          Shop_member_addr.create(body).exec(function (e2, o2) {
            return res.json({code: 0, msg: ''});
          });
        });
    } else {
      return res.json({code: 1, msg: ''});
    }
  },
  listAddr: function (req, res) {
    var member = req.session.member;
    if (member && member.memberId > 0) {
      Shop_member_addr.find({memberId: member.memberId}).sort({createdAt: 'desc'}).sort({is_default: 'desc'}).exec(function (e, l) {
        return res.json({code: 0, msg: '', list: l});
      });
    } else {
      return res.json({code: 1, msg: '', list: []});
    }
  },
  setDefault: function (req, res) {
    var member = req.session.member;
    if (!member || member.memberId < 1) {
      return res.json({code: 1, msg: ''});
    }
    var id = req.params.id;
    Shop_member_addr.update({memberId: member.memberId}, {is_default: false}).exec(function (e1, o1) {
      Shop_member_addr.update(id, {is_default: true}).exec(function (e2, o2) {
        return res.json({code: 0, msg: ''});
      });
    });
  },
  editAddr: function (req, res) {
    var member = req.session.member;
    if (!member || member.memberId < 1) {
      return res.json({code: 1, msg: ''});
    }
    var id = req.body.id;
    Shop_member_addr.update({memberId: member.memberId,id:id}, req.body).exec(function (e1, o1) {
      return res.json({code: 0, msg: ''});
    });
  },
  del: function (req, res) {
    var member = req.session.member;
    if (!member || member.memberId < 1) {
      return res.json({code: 1, msg: ''});
    }
    var id = req.params.id;
    Shop_member_addr.findOne(id).exec(function (e, o) {
      if (e)
        return res.json({code: 2, msg: ''});
      Shop_member_addr.destroy(id).exec(function (err) {
        if (o.is_default) {
          Shop_member_addr.find({memberId: member.memberId}).sort({createdAt: 'desc'}).limit(1).exec(function (e1, list) {
            if (list.length > 0) {
              Shop_member_addr.update(list[0].id, {is_default: true}).exec(function (e2, o2) {
              });
            }
          });
        }
        return res.json({code: 0, msg: ''});
      });
    });
  }
};
