// 获取 gulp
var gulp = require('gulp');
// 获取 gulp-ruby-sass 模块
var sass = require('gulp-sass');

var modifyCssUrls=require('gulp-modify-css-urls');

// 编译sass
// 在命令行输入 gulp sass 启动此任务
gulp.task('sass', function() {
    gulp.src("src/scss/*.scss")
        .pipe(sass())
        .pipe(gulp.dest("dist/css"))
        .pipe(modifyCssUrls(
            {
                modify: function (url, filePath) {
                    return url.substring(3)
                }
            })
        );
});