const path = require('path');

module.exports = {
  mode: 'production',
  entry: './src/index.js',
  output: {
    path: path.resolve(__dirname, '../inst/htmlwidgets/lib/widget'),
    filename: 'deckgl-widget.min.js'
  }
};
