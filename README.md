__extends
=========

Requireable CoffeeScript  `__extends` [![Build Status][travis-image]][travis-url]
---------------------------------------------------------------------------------

[![NPM][npm-image]][npm-url]

Install
-------
```
npm install --save extends__
```

Use with [GULP][gulp-url]
-------------------------

#### [CoffeeScript][coffee-url]

```coffeescript
gulp = require 'gulp'
replace = require 'gulp-replace'
re = /((__)?extends?)\s*=\s*function\(child,\s*parent\)\s*\{.+?return\s*child;\s*\}/

gulp.task 'coffee', ->
  gulp
    .src [ './source/**/*.+(coffee|litcoffee)' ]
    .pipe replace re, '$1 = require("extends__")'
    .pipe gulp.dest './build'
```

#### JavaScript

```javascript
var gulp, replace, re;
gulp = require('gulp');
replace = require('gulp-replace');
re = /((__)?extends?)\s*=\s*function\(child,\s*parent\)\s*\{.+?return\s*child;\s*\}/;

gulp.task('coffee', function() {
  gulp
    .src([ './source/**/*.+(coffee|litcoffee)' ])
    .pipe(replace(re, '$1 = require("extends__")'))
    .pipe(gulp.dest('./build'));
});
```

Build
-----
```
git clone https://github.com/nhz-io/extends__.git
cd extends__
npm install
gulp
```

LICENSE
-------
#### [MIT](LICENSE)

VERSION
-------
#### 0.0.3
* Better `README.md`
* Now wrapping default [CoffeScript][coffee-url] extends

[coffee-url]: https://github.com/jashkenas/coffeescript
[gulp-url]: https://github.com/gulpjs/gulp

[travis-image]: https://travis-ci.org/nhz-io/extends__.svg
[travis-url]: https://travis-ci.org/nhz-io/extends__

[npm-image]: https://nodei.co/npm/extends__.png
[npm-url]: https://nodei.co/npm/extends__
