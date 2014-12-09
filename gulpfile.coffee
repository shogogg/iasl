gulp    = require "gulp"
plugins = require "gulp-load-plugins"
stream  = require "event-stream"
runseq  = require "run-sequence"
del     = require "del"


#
# 設定
#
opts = {}

opts.bower =
  src:  "bower_components"
  dest: "app/components"
  uglify: "{modernizr,underscore}/*.js"
  components:
    "jquery": "jquery/dist/*.{js,map}"
    "bespoke": "bespoke{.js,-*}/dist/*.{js,map}"

opts.html =
  src:  "src/index.html"
  dest: "app"

opts.less =
  src:  "src/styles.less"
  dest: "app"

opts.coffee =
  src:  "src/app.coffee"
  dest: "app"

#
# プラグイン自動読み込み
#
$ = plugins()


#
# Default
#
gulp.task "default", (done) -> runseq("bower", "build", done)


#
# Build
#
gulp.task "build", ["html", "less", "coffee"]


#
# Bower
#
gulp.task "bower", ["bower:install"]
gulp.task "bower:download", -> $.bower(opts.bower.src)
gulp.task "bower:install", ["bower:download"], () ->
  del.sync opts.bower.dest
  stream.merge.apply null, (for dest, src of opts.bower.components
    gulp.src("#{opts.bower.src}/#{src}")
      .pipe $.rename(dirname: "")
      .pipe gulp.dest("#{opts.bower.dest}/#{dest}")
  )


#
# HTML
#
gulp.task "html", ->
  del.sync "#{opts.less.dest}/*.html"
  gulp.src(opts.html.src)
    .pipe $.plumber()
    .pipe $.htmlmin(removeComments: true, collapseWhitespace: true)
    .pipe gulp.dest(opts.html.dest)


#
# LESS
#
gulp.task "less", ->
  del.sync "#{opts.less.dest}/*.css"
  gulp.src opts.less.src
    .pipe $.plumber()
    .pipe $.less(compress: true)
    .pipe gulp.dest(opts.less.dest)


#
# CoffeeScript
#
gulp.task "coffee", ->
  del.sync "#{opts.coffee.dest}/*.js"
  gulp.src opts.coffee.src
    .pipe $.plumber()
    .pipe $.coffee()
    .pipe gulp.dest(opts.coffee.dest)


#
# Watch
#
gulp.task "watch", ["watch:html", "watch:less", "watch:coffee"]
gulp.task "watch:html", ["html"], -> gulp.watch opts.html.src, ["html"]
gulp.task "watch:less", ["less"], -> gulp.watch opts.less.src, ["less"]
gulp.task "watch:coffee", -> gulp.watch opts.coffee.src, ["coffee"]


#
# Help
#
gulp.task "help", $.taskListing
