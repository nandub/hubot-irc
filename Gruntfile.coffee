#global module:false
module.exports = (grunt) ->
  
  # Project configuration.
  grunt.initConfig
    watch:
      files: ["src/**/*.coffee"]
      tasks: ["coffee", "jshint"]

    nodeunit: {
      all: ['test/**/*_test.js']
    }

    jshint:
      files: ["Gruntfile.js", "src/**/*.js", "test/**/*.js"]
      options:
        curly: true
        eqeqeq: true
        immed: true
        latedef: true
        newcap: true
        noarg: true
        sub: true
        undef: true
        boss: true
        eqnull: true

        globals:
          jQuery: true
          require: true
          module: true
          process: true

    coffee:
      compile:
        files:
          "lib/irc.js": "src/irc.coffee"

    coffeelint:
      client: ["Gruntfile.coffee", "src/**/*.coffee"]
      options:
        indentation:
          value: 2
          level: 'error'
        no_empty_param_list:
          level: 'ignore'
        no_implicit_braces:
          level: 'ignore'
        no_implicit_parens:
          level: 'ignore'
        max_line_length:
          level: 'ignore'

  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-jshint"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-nodeunit"
  grunt.loadNpmTasks "grunt-coffeelint"
  
  # Default task.
  grunt.registerTask "default", ["coffee", "jshint", "coffeelint"]
