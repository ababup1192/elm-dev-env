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
                test: /\.(html)$/,
                loader: 'file-loader',
                options: {
                    name: '[name].[ext]',
                    context: '',
                }
            },
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
    mode: process.env.WEBPACK_SERVE ? 'development' : 'production',
    serve: {
      contentBase: `${__dirname}/dist`,
      port: '8080',
      open: true,
    }
};
