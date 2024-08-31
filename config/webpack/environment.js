const { environment } = require('@rails/webpacker');

const customConfig = {
  test: /\.css$/,
  use: [
    'style-loader',
    'css-loader'
  ]
};

environment.loaders.append('css', customConfig);

module.exports = environment;
