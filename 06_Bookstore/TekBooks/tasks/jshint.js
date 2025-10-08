'use strict';

module.exports = function (grunt) {
  // Load the plugin
  grunt.loadNpmTasks('grunt-contrib-jshint');

  // Configure the task
  grunt.config.set('jshint', {
    files: [
      'Gruntfile.js',
      'server.js',
      'index.js',
      'controllers/**/*.js',
      'lib/**/*.js',
      'models/**/*.js',
      'tasks/**/*.js'
    ],
    options: {
      jshintrc: '.jshintrc'
    }
  });
};

