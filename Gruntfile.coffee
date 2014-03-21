module.exports = (grunt) ->
  grunt.initConfig
    connect:
      app:
        options:
          port: 2000
          base: "build/"
          open: "http://localhost:2000"

      doc:
        options:
          port: 2001
          base: "doc/"
          open: "http://localhost:2001"

    compass:
      dist:
        options:
          sassDir: "src/stylesheets"
          cssDir: "build/css"
          specify: "src/stylesheets/*.scss"
          bundleExec: true
          environment: "development"

    csscomb:
      dist:
        files:
          "src/stylesheets/*.scss": ["src/stylesheets/*.scss"]

    csslint:
      dist:
        options:
          csslintrc: '.csslintrc'
        src: ['build/css/app.css']

    csso:
      dist:
        files:
          "build/css/app.min.css": ["build/css/app.css"]

    watch:
      options:
        livereload: true

      stylesheets:
        files: ["src/stylesheets/*.scss"]
        tasks: ["stylesheet"]

  grunt.loadNpmTasks "grunt-contrib-connect"
  grunt.loadNpmTasks "grunt-contrib-compass"
  grunt.loadNpmTasks "grunt-contrib-csslint"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-csscomb"
  grunt.loadNpmTasks "grunt-csso"
  grunt.loadNpmTasks "grunt-kss"
  grunt.loadNpmTasks "grunt-uncss"

  grunt.registerTask "default", ["develop"]
  grunt.registerTask "develop", [
    "connect:app"
    "watch"
  ]
  grunt.registerTask "stylesheet", [
    "compass"
    "csscomb"
    "csslint"
  ]
  grunt.registerTask "publish", [
    "stylesheet"
    "kss"
    "connect:doc"
    "watch"
  ]
  grunt.registerTask "build", [
    "stylesheet"
    "csso"
  ]
  return
