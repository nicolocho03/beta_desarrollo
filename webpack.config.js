const path = require('path');
const { WebpackManifestPlugin } = require('webpack-manifest-plugin');

module.exports = {
  mode: 'development', // Cambia a 'production' para producción
  entry: './app/javascript/packs/application.js', // Ruta a tu archivo de entrada
  output: {
    filename: 'bundle.js',
    path: path.resolve(__dirname, 'public/packs'), // Directorio de salida
    publicPath: '/packs/', // Directorio público para archivos estáticos
  },
  resolve: {
    extensions: ['.js', '.jsx'],
  },
  module: {
    rules: [
      {
        test: /\.css$/, // Aplica esta regla a archivos .css
        use: [
          'style-loader', // Inserta CSS en el DOM
          'css-loader'    // Interpreta los imports de CSS
        ],
      },
    ],
  },
  plugins: [
    new WebpackManifestPlugin({
      fileName: 'manifest.json',
      publicPath: '/packs/',
    }),
  ],
};


