"use strict"
module.exports = (grunt) ->

  require("load-grunt-tasks")(grunt)
  require("time-grunt")(grunt)

  config =
    app: "app"
    dist: "dist"


  grunt.initConfig
    config: config

    watch:
      gruntfile:
        files: "Gruntfile.coffee"
      scripts:
        files: "<%= config.app %>/coffee/*.coffee"
        tasks: "jshint"
      css:
        files: "<%= config.app %>/scss/*.scss"
        tasks: "compass"
      html:
        files: "<%= config.app %>/{,*/}*.html"
        tasks: "htmlmin"

    sass:
      dist:
        files:
          "<%= config.dist %>/style/main.css": "<%= config.app %>/scss/*.scss"
        options:
          style: "expanded"
          banner: "/* Designed by JSANN. */"

    compass:
      dist:
        options:
          sassDir: "<%= config.app %>/scss"
          cssDir: "<%= config.dist %>/style"

    jshint:
      files: "<%= config.app %>/coffee/*.coffee"

    htmlmin:
      options:
        removeComments: true
      files:
        expend: true
        cwd: "<%= config.app %>"
        dest: "<%= config.dist %>"
        src: "{,*/}*.html"

    copy:
      dist:
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

    clean:
      dist:
        src: "dist/{,**/}*"

  grunt.registerTask("default", ["copy", "compass", "jshint", "htmlmin"])
