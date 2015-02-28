_ = (require './package.json').gulpfile

$ =
  gulp       :require 'gulp'
  util       :require 'gulp-util'
  test       :require 'gulp-mocha'
  coffee     :require 'gulp-coffee'
  lint       :require 'gulp-coffeelint'
  del        :require 'del'
  run        :require 'run-sequence'

$.gulp.task 'default', (cb) -> $.run [ 'build', 'test', 'dist' ], cb

$.gulp.task 'clean', (cb) -> $.del [ _.build, _.dist ], cb

$.gulp.task 'lint', ->
  $.gulp
    .src [ "#{_.source}/**/*.coffee" ]
    .pipe $.lint './coffeelint.json'
    .pipe $.lint.reporter()

$.gulp.task 'build', [ 'clean', 'lint'], ->
  $.gulp
    .src [ "#{_.source}/**/*.+(coffee|litcoffee)" ]
    .pipe $.coffee bare:true, $.util.log
    .pipe $.gulp.dest _.build

$.gulp.task 'test', [ 'build' ], ->
  $.gulp
    .src [ "#{_.test}/**/*.js" ], read: false
    .pipe $.test reporter: 'tap'

$.gulp.task 'dist', [ 'build', 'test' ], ->
  $.gulp
    .src [ "#{_.build}/**", "!#{_.build}/test{,/**}" ]
    .pipe $.gulp.dest _.dist
