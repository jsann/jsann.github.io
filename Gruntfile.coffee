'use strict';
module.exports = (grunt) ->

  require("load-grunt-tasks")(grunt);
  require("time-grunt")(grunt);

  config =
    app: "app"
    dist: "dist"
    site: "_site"

  grunt.initConfig
    config: config

    scss:
      options:
        style: "expanded"
        sourcemap: true
        banner: "css files"
      files:
        "main.css": "<% config.app %>/scss/{,*/}*.scss"

    copy:
      dest:
        files: [
          expand: true
          cwd: "<%= config.app %>"
          dest: "<%= config.dist %>"
          src: [
            "*.ico"
            "{,*/}*.{html,md}"
            "images/*/*.*"
          ]
        ,
          expand: true
          cwd: "<%= config.app %>"
          dest: ""
          src: [
            "*.ico"
            "*.html"
          ]
        ]

  grunt.registerTask("default", ["copy"]);
