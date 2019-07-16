const path = require('path');

module.exports = {
  mode: 'production',
  entry: './src/index.js',
  output: {
    filename: 'deckgl.js',
    path: path.resolve(__dirname, 'dist')
  }
};
