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
      scripts:
        files: "<%= config.app %>/coffee/*.coffee"
        tasks: "jshint"
      css:
        files: "<%= config.app %>/scss/*.scss"
        tasks: "sass"

    sass:
      dist:
        files:
          "<%= config.dist %>/style/main.css": "<%= config.app %>/scss/*.scss"
        options:
          style: "expanded"
          banner: "/* css files */"

    jshint:
      files: [
        # "Gruntfile.coffee"
        "<%= config.app %>/coffee/*.coffee"
      ]

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

  grunt.registerTask("default", ["copy", "sass", "jshint"])
