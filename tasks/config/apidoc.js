/**
 * Created by wizzer on 2016/5/24.
 */
module.exports = function (grunt) {
  grunt.config.set('apidoc', {
    myapp: {
      src: "api/controllers/api",
      dest: "apidoc/",
      options: {
        includeFilters: [ ".*\\.json$" ]
      }
    }
  });
  grunt.loadNpmTasks('grunt-apidoc');
};
