module.exports = function (grunt) {
	grunt.registerTask('compileAssets', [
		'clean:dev',
		'jst:dev',
		'less:dev',
		'copy:dev',
		'coffee:dev'
    //'apidoc:myapp' // <-- This will now run every time your assets are compiled
	]);
};
