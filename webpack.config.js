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
                loader: ['style-loader', 'css-loader'],
            },
            {
                test:    /\.elm$/,
                loader: 'elm-webpack-loader',
                options: {
                    warn: true,
                    debug: true,
                }
            },
        ],
    },
    plugins: [
        new HtmlWebpackPlugin({
            title: 'Elm app',
            template: `${__dirname}/src/index.html`,
        })
    ],
    mode: process.env.WEBPACK_SERVE ? 'development' : 'production',
    serve: {
      contentBase: `${__dirname}/dist`,
      port: '8080',
      open: true,
    }
};
