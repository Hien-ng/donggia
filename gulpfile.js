const del = require('del')
gulp = require('gulp')
pug = require('gulp-pug')
Fiber = require('fibers')
sass = require('gulp-sass')
cssnano = require('cssnano')
babel = require('gulp-babel')
uglify = require('gulp-terser')
concat = require('gulp-concat')
rename = require('gulp-rename')
replace = require('gulp-replace')
plumber = require('gulp-plumber')
postcss = require('gulp-postcss')
prefixer = require('autoprefixer')
srcmap = require('gulp-sourcemaps')
cssImport = require('gulp-cssimport')
sassUnicode = require('gulp-sass-unicode')
cssDeclarationSorter = require('css-declaration-sorter')
browserSync = require('browser-sync').create()
readFileSync = require('graceful-fs').readFileSync
sass.compiler = require('dart-sass');


///////////////////////////////////
var settings = JSON.parse(readFileSync('./page.json'));
const buildAll = settings.buildAll
const pageList = settings.page
///////////////////////////////////
var ArrayJs = [];
var ArrayCss = [];
var ArrayHtml = [];

if (buildAll == true) {
	pageList.forEach(page => {
		ArrayJs.push(page)
		ArrayCss.push(page)
		ArrayHtml.push(page)
	});
} else {
	pageList.forEach(page => {
		if (page.isWorking == true) {
			ArrayJs.push(page)
			ArrayCss.push(page)
			ArrayHtml.push(page)
		}
	});
}

var singleTaskJs = Object.keys(ArrayJs);
var singleTaskCss = Object.keys(ArrayCss);
var singleTaskHtml = Object.keys(ArrayHtml);
///////////////////////////////////

// Task clean
gulp.task('clean', function () {
	return del(['./dist']);
})

// Task copy fonts
gulp.task('copyFonts', function () {
	let config = JSON.parse(readFileSync('./config.json'));
	return gulp.src(config.font)
		.pipe(gulp.dest('./dist/fonts'));
})

gulp.task('copyFonts2', function () {
	return gulp.src('./src/assets/fonts/*.{woff2,woff,eot,ttf}')
		.pipe(gulp.dest('./dist/fonts'));
})

// Task clean imagess
gulp.task('cleanImages', function () {
	return del(['./dist/img'])
})

// Task copy img
gulp.task('copyImages', function () {
	return gulp.src('./src/assets/img/**/**.{svg,gif,png,jpg,jpeg}')
		.pipe(gulp.dest('./dist/img'));
})

// Start task js
singleTaskJs.forEach(function (number) {
	console.log(number)
	ArrayJs[number].js.push('./src/pages/' + ArrayJs[number].name + '/index.js');
	gulp.task('scripts:' + ArrayJs[number].name, function () {
		return gulp.src(ArrayJs[number].js)
			.pipe(srcmap.init())
			.pipe(concat(ArrayJs[number].name + ".js"))
			// .pipe(babel({
			// 	presets: ['@babel/env']
			// }))
			.pipe(uglify())
			.pipe(srcmap.write('.'))
			.pipe(rename({
				suffix: '.min'
			}))
			.pipe(gulp.dest('dist/js'))
			.pipe(browserSync.reload({
				stream: true
			}));
	});
});

gulp.task('processJs', function () {
	// singleTaskJs.map(function (number) {
	// 	return 'scripts:' + ArrayJs[number].name;
	// })
	return gulp.src('./src/pages/index.js')
		.pipe(srcmap.init())
		// .pipe(babel({
		// 	presets: ['@babel/env']
		// }))
		.pipe(uglify())
		.pipe(srcmap.write('.'))
		.pipe(rename({
			suffix: '.min',
			basename: 'main'
		}))
		.pipe(gulp.dest('dist/js'))
})

gulp.task('globalJs', function () {
	let glob = JSON.parse(readFileSync("./config.json"))

	return gulp.src(glob.globalJs, {
			allowEmpty: true
		})
		.pipe(concat('global.min.js'))
		.pipe(uglify())
		.pipe(gulp.dest('dist/js'))
		.pipe(browserSync.reload({
			stream: true
		}))
})
// End task JS


// Start task CSS
singleTaskCss.forEach(function (number) {
	gulp.task('css:' + ArrayCss[number].name, function () {
		return gulp.src([
				'./src/pages/' + ArrayCss[number].name + '/index.sass',
			])
			.pipe(srcmap.init())
			.pipe(sass.sync({
				fiber: Fiber
			}).on('error', sass.logError))
			.pipe(sassUnicode())
			.pipe(cssImport())
			.pipe(postcss([
				prefixer({
					browsers: ['last 4 version', "IE 10"],
					cascade: false,
				}),
				cssnano(),
				cssDeclarationSorter({
					order: 'smacss'
				})
			]))
			.pipe(rename({
				basename: ArrayCss[number].name,
				suffix: '.min'
			}))
			.pipe(srcmap.write('.'))
			.pipe(gulp.dest('./dist/css'))
			.pipe(browserSync.reload({
				stream: true
			}))
	});
});

gulp.task('processCss', function () {
	// gulp.series(
	// 	singleTaskCss.map(function (number) {
	// 		return 'css:' + ArrayCss[number].name;
	// 	})
	// )

	return gulp.src('./src/pages/**/index.sass')
		.pipe(srcmap.init())
		.pipe(concat('main.min.sass'))
		.pipe(replace('../../','../'))
		.pipe(sass.sync({
			fiber: Fiber
		}).on('error', sass.logError))
		.pipe(sassUnicode())
		.pipe(cssImport())
		.pipe(postcss([
			prefixer({
				browsers: ['last 4 version', "IE 10"],
				cascade: false,
			}),
			cssnano(),
			cssDeclarationSorter({
				order: 'smacss'
			})
		]))
		.pipe(srcmap.write('.'))
		.pipe(gulp.dest('./dist/css'))
		.pipe(browserSync.reload({
			stream: true
		}))
})

gulp.task('globalCss', function () {
	return gulp.src("./src/shared/index.sass", {
			allowEmpty: true,
		})
		.pipe(srcmap.init())
		.pipe(sass.sync({
			fiber: Fiber
		}).on('error', sass.logError))
		.pipe(sassUnicode())
		.pipe(cssImport())
		.pipe(postcss([
			prefixer({
				browsers: ['last 4 version', "IE 10"],
				cascade: false,
			}),
			cssnano(),
			cssDeclarationSorter({
				order: 'smacss'
			})
		]))
		.pipe(rename({
			basename: "global",
			suffix: '.min'
		}))
		.pipe(srcmap.write('.'))
		.pipe(gulp.dest('./dist/css'))
		.pipe(browserSync.reload({
			stream: true
		}))
})
// End task CSS


// Start task Html
singleTaskHtml.forEach(function (number) {
	gulp.task('html:' + ArrayHtml[number].name, function () {
		return gulp.src('./src/pages/' + ArrayHtml[number].name + '/index.pug')
			.pipe(pug({
				pretty: '\t',
			}))
			.pipe(rename({
				basename: ArrayHtml[number].name,
			}))
			.pipe(plumber())
			.pipe(gulp.dest('./dist/'))
			.pipe(browserSync.reload({
				stream: true
			}));
	});
});
gulp.task('processHtml',
	gulp.series(
		singleTaskHtml.map(function (number) {
			return 'html:' + ArrayHtml[number].name;
		})
	)
)
// End task Html



// Task watch
gulp.task('serve', function () {
	browserSync.init({
			notify: false,
			server: {
				baseDir: './dist',
			},
			port: 8000
		}),
		gulp.watch(
			[
				'./src/assets/img/**/**.{svg,gif,png,jpg,jpeg}'
			],
			gulp.series('cleanImages', 'copyImages')
		),
		gulp.watch(
			[
				'./src/**/**.pug',
			],
			gulp.series('processHtml')
		),
		gulp.watch(
			[
				'./src/shared/**/**.js',
				'./config.json'
			],
			gulp.series('globalJs')
		),
		gulp.watch(
			[
				'./src/shared/**/**.sass',
			],
			gulp.series('globalCss')
		),
		gulp.watch(
			[
				'./src/pages/**/**.sass',
				'./src/components/**/**.sass',
			],
			gulp.series('processCss')
		),
		gulp.watch(
			[
				'./src/pages/**/**.js',
				'./src/components/**/**.js',
			],
			gulp.series('processJs')
		),
		gulp.watch('./dist/*').on('change', browserSync.reload)
})
// End task watch





gulp.task('done', function (cb) {
	console.log('Done!!');
	cb()
})

// Gulp task defaul
gulp.task('default', gulp.series(
	'clean',
	'copyImages',
	'copyFonts',
	'copyFonts2',
	'globalCss',
	'globalJs',
	'processHtml',
	'processCss',
	'processJs',
	'serve'
))

// gulp.task('build', gulp.series(
// 	'clean',
// 	'copyImages',
// 	'copyFonts',
// 	'copyFonts2',
// 	'globalCss',
// 	'globalJs',
// 	'done'
// ))