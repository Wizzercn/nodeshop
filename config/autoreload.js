/**
 * Created by root on 2/1/16.
 */
module.exports.autoreload = {
  active: true,
  usePolling: false,
  dirs: [
    "api/common",
    "api/policies",
    "api/models",
    "api/controllers",
    "api/services",
    "config"
  ],
  ignored: [
    // Ignore all files with .ts extension
    "**.ts"
  ]
};
