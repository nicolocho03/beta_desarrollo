const path = require('path');

module.exports = {
  mode: 'development', // Cambia a 'production' para producción
  entry: './app/javascript/packs/application.js', // Ruta a tu archivo de entrada
  output: {
    filename: 'bundle.js',
    path: path.resolve(__dirname, 'public/packs'), // Directorio de salida
  },
  resolve: {
    extensions: ['.js', '.jsx'],
  },
};
