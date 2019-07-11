export default function(_layers) {
  var layers = _layers.map(function(item) {
      if (item.properties.dataframeToD3) {
        item.data = HTMLWidgets.dataframeToD3(item.data);
      }

      item.properties.data = item.data;
      return makeLayer(item.className, item.properties);
    });
    return layers;
}

var makeLayer = function(className, props) {
  return new deck[className](props);
};
