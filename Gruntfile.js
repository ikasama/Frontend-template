module.exports = function(grunt) {

  grunt.loadNpmTasks('grunt-styleguide');
  grunt.loadNpmTasks('grunt-contrib-clean');

  grunt.initConfig({
    compass: {
	    compile: {
        options: {
          sassDir: 'scss',
          cssDir: 'css',
          specify: 'scss/*.scss'
        }
      }
    },

    sass: {
      files: {
        expand: true,
        flatten: true,
        src: ['scss/*.scss'],
        dest: 'css/',
        ext: '.css'
      }
    },

    styleguide: {
      styledocco: {
        options: {
          name: 'Project Name',
          framework: {
            name: 'styledocco',
            options: {
              preprocessor: 'sass'
            }
          },
          template: {
            include: [
              'js/_previews.js'
            ]
          }
        },
        src: [
          'scss/*.scss'
        ],
        dest: 'docs'
      }
    },
    clean: {
      styleguide: [
        '<%= styleguide.styledocco.dest %>'
      ]
    },

    watch: {
      stylesheets: {
        files: ['scss/*.scss'],
        tasks: ['compass']
      },
    },

  });

  grunt.registerTask('default', [
      'clean',
      'styleguide'
  ]);

  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-sass');
  grunt.loadNpmTasks('grunt-contrib-compass');

};