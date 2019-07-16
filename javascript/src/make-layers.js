export default function(el, layers) {
  return layers.map(function(item) {
    var properties = item.properties;
    if (properties.dataframeToD3) {
      item.data = HTMLWidgets.dataframeToD3(item.data);
    }

    if (HTMLWidgets.shinyMode) {
      properties.onClick = function(info) {
        var data = { lng: info.lngLat[0], lat: info.lngLat[1], object: info.object };
        Shiny.onInputChange(el.id + "_onclick", data);
      };
    }

    if (properties.getTooltip) {
      addTooltipTo(properties);
    }

    properties.data = item.data;
    return new deck[item.className](properties);
  });
}

var addTooltipTo = function(properties) {
  properties.onHover = function({ x, y, object }) {
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
