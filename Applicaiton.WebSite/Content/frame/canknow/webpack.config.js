/**
 * Created by canknow on 2017/6/25.
 */
var webpack = require('webpack');
var commonsPlugin = new webpack.optimize.CommonsChunkPlugin('common');
var path = require('path');

module.exports = {
    //插件项
    plugins: [commonsPlugin],
    //页面入口文件配置
    entry: {
        canknow : './src/js/canknow.js'
    },
    //入口文件输出配置
    output: {
        path: path.join(__dirname, 'dist/js'),
        filename: '[name].js'
    },
    externals: {
        jquery: "jQuery"
    },
    module: {
        //加载器配置
        loaders: [
            { test: /\.css$/, loader: 'style-loader!css-loader' },
            { test: /\.js$/, loader: 'babel-loader', query: {
                presets: ['es2015']
            } },
            { test: /\.(png|jpg)$/, loader: 'url-loader?limit=8192'}
        ]
    },
};