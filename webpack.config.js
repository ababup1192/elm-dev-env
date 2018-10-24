const HtmlWebpackPlugin = require('html-webpack-plugin')

module.exports = {
    entry: `${__dirname}/src/index.js`,
    output: {
        path: `${__dirname}/dist`,
        filename: 'bundle.js',
        libraryTarget: 'window',
    },
    module: {
        rules: [
            {
                test: /\.(css|scss)$/,
                loader: ['style-loader', 'css-loader', 'sass-loader'],
            },
            {
                test:    /\.elm$/,
                loader: 'elm-webpack-loader',
                options: {
                    debug: true,
                    pathToElm: '.bin/unbuffered-elm-make'
                }
            },
            {
                test: /\.svg$/,
                loader: 'url-loader'
            }
        ],
    },
    plugins: [
        new HtmlWebpackPlugin({
            title: 'Elm app',
            template: `${__dirname}/src/index.html`,
        })
    ],
    mode: process.env.WEBPACK_SERVE ? 'development' : 'production',
    devServer: {
      port: '8080',
      compress: true,
      watchContentBase: true,
      open: 'Google Chrome',
    }
};
