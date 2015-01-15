"use strict"
module.exports = (grunt) ->

  require("load-grunt-tasks")(grunt)
  require("time-grunt")(grunt)

  config =
    app: "app"
    dist: "dist"

  grunt.initConfig
    config: config

    sass:
      dest:
        files:
          "dist/style/main.css": "app/scss/*.scss"
        options:
          style: "expanded"
          sourcemap: true
          banner: "/* css files */"

    jshint:
      files: [
        # "Gruntfile.coffee"
        "<% config.app %>/coffee/*.coffee"
      ]

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

  grunt.registerTask("default", ["copy", "sass", "jshint"])
