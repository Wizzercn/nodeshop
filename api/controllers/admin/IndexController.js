/**
 * IndexController
 *
 * @description :: Server-side logic for managing indices
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
  list: function (req, res) {
    console.log(req.params.key);
    return res.json({
      todo: 'Not implemented yet!'
    });
  }
};

