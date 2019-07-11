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

var makeLayer = function(className, properties) {
  if (properties.getTooltip) {
    addTooltip(properties);
  }

  return new deck[className](properties);
};

var addTooltip = function(properties) {
  properties.onHover = function({ x, y, object }) {
    // console.log(x, y, object);
    var tooltipElement = _deckGLWidget.tooltipElement;
    if (!object) {
      tooltipElement.innerHTML = "";
      return;
    }

    var text = properties.getTooltip(object);
    if (!properties.fixedTooltip) {
      tooltipElement.style.top = y + "px";
      tooltipElement.style.left = x + "px";
    }

    tooltipElement.innerHTML = text;
  };
};
