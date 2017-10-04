module.exports = {
    entry: './src/index.js',

    output: {
        path: `${__dirname}/dist`,
        filename: 'bundle.js',
    },

    module: {
        rules: [
            {
                test: /\.(css|scss)$/,
                use: [
                    'style',
                    'css',
                ]
            },
            {
                test:    /\.html$/,
                exclude: /node_modules/,
                use:  'file?name=[name].[ext]',
            },
            {
                test:    /\.elm$/,
                exclude: [/elm-stuff/, /node_modules/],
                use:  'elm-webpack?verbose=true&warn=true&debug=true',
            },
        ],

        noParse: /\.elm$/,
    },

    resolveLoader: {
        moduleExtensions: ["-loader"]
    },

    devServer: {
        inline: true,
        stats: { colors: true },
    },

};
