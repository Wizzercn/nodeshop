/**
 * Route Mappings
 * (sails.config.routes)
 *
 * Your routes map URLs to views and controllers.
 *
 * If Sails receives a URL that doesn't match any of the routes below,
 * it will check for matching files (images, scripts, stylesheets, etc.)
 * in your assets directory.  e.g. `http://localhost:1337/images/foo.jpg`
 * might match an image file: `/assets/images/foo.jpg`
 *
 * Finally, if those don't match either, the default 404 handler is triggered.
 * See `api/responses/notFound.js` to adjust your app's 404 logic.
 *
 * Note: Sails doesn't ACTUALLY serve stuff from `assets`-- the default Gruntfile in Sails copies
 * flat files from `assets` to `.tmp/public`.  This allows you to do things like compile LESS or
 * CoffeeScript for the front-end.
 *
 * For more information on configuring custom routes, check out:
 * http://sailsjs.org/#!/documentation/concepts/Routes/RouteTargetSyntax.html
 */

module.exports.routes = {

  /***************************************************************************
  *                                                                          *
  * Make the view located at `views/homepage.ejs` (or `views/homepage.jade`, *
  * etc. depending on your default view engine) your home page.              *
  *                                                                          *
  * (Alternatively, remove this and add an `index.html` file in your         *
  * `assets` directory)                                                      *
  *                                                                          *
  ***************************************************************************/
  /***********************PC****************************************/
  '/': 'public/shop/pc/IndexController.index',
  '/hot': 'public/shop/pc/HotController.index',
  '/hot/ajax': 'public/shop/pc/HotController.ajax',
  '/search': 'public/shop/pc/HotController.index',
  '/search/ajax': 'public/shop/pc/HotController.ajax',
  '/list/:id': 'public/shop/pc/ListController.index',
  '/list/:id/ajax': 'public/shop/pc/ListController.ajax',
  '/goods/:id': 'public/shop/pc/GoodsController.one',
  '/channel/:id': 'public/shop/pc/ChannelController.index',
  '/info/:id': 'public/shop/pc/InfoController.index',
  '/join': 'public/shop/pc/AccountController.join',
  '/login': 'public/shop/pc/AccountController.login',
  '/member': 'public/shop/pc/member/MemberController.index',
  '/member/address': 'public/shop/pc/member/AddressController.index',
  '/member/coupon': 'public/shop/pc/member/CouponController.index',
  '/member/money': 'public/shop/pc/member/MoneyController.index',
  '/member/order': 'public/shop/pc/member/OrderController.index',
  '/member/comment': 'public/shop/pc/member/CommentController.index',
  '/member/password': 'public/shop/pc/member/PasswordController.index',
  '/member/pay': 'public/shop/pc/member/PayController.index',
  '/member/profile': 'public/shop/pc/member/ProfileController.index',
  '/member/score': 'public/shop/pc/member/ScoreController.index',
  '/shopcart/list': 'public/shop/pc/ShopcartController.list',
  '/shopcart/buy': 'public/shop/pc/ShopcartController.buy',
  '/shopcart/order/:id': 'public/shop/pc/ShopcartController.order',
  /***********************PC****************************************/
  /***********************WAP****************************************/
  '/wap': 'public/shop/wap/IndexController.index',
  '/wap/': 'public/shop/wap/IndexController.index',
  '/wap/hot': 'public/shop/wap/HotController.index',
  '/wap/hot/ajax': 'public/shop/wap/HotController.ajax',
  '/wap/search': 'public/shop/wap/HotController.index',
  '/wap/search/ajax': 'public/shop/wap/HotController.ajax',
  '/wap/list/:id': 'public/shop/wap/ListController.index',
  '/wap/list/:id/ajax': 'public/shop/wap/ListController.ajax',
  '/wap/goods/:id': 'public/shop/wap/GoodsController.one',
  '/wap/channel/:id': 'public/shop/wap/ChannelController.index',
  '/wap/info/:id': 'public/shop/wap/InfoController.index',
  '/wap/join': 'public/shop/wap/AccountController.join',
  '/wap/login': 'public/shop/wap/AccountController.login',
  '/wap/member': 'public/shop/wap/member/MemberController.index',
  '/wap/member/address': 'public/shop/wap/member/AddressController.index',
  '/wap/member/coupon': 'public/shop/wap/member/CouponController.index',
  '/wap/member/money': 'public/shop/wap/member/MoneyController.index',
  '/wap/member/order': 'public/shop/wap/member/OrderController.index',
  '/wap/member/comment': 'public/shop/wap/member/CommentController.index',
  '/wap/member/password': 'public/shop/wap/member/PasswordController.index',
  '/wap/member/pay': 'public/shop/wap/member/PayController.index',
  '/wap/member/profile': 'public/shop/wap/member/ProfileController.index',
  '/wap/member/score': 'public/shop/wap/member/ScoreController.index',
  '/wap/shopcart/list': 'public/shop/wap/ShopcartController.list',
  '/wap/shopcart/buy': 'public/shop/wap/ShopcartController.buy',
  '/wap/shopcart/order/:id': 'public/shop/wap/ShopcartController.order',
  /***********************WAP****************************************/
  '/sysadmin': 'private/LoginController.login',
  '/sysadmin/home': 'private/HomeController.index',
  '/test':'/sysadmin'

  /***************************************************************************
  *                                                                          *
  * Custom routes here...                                                    *
  *                                                                          *
  * If a request to a URL doesn't match any of the custom routes above, it   *
  * is matched against Sails route blueprints. See `config/blueprints.js`    *
  * for configuration options and examples.                                  *
  *                                                                          *
  ***************************************************************************/

};
