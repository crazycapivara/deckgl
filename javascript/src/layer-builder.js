import makeDataAccessor from "./helpers/make-data-accessor";

export default function(el, layer) {
  const self = this;

  const properties = layer.properties;

  const tooltipElement = _deckGLWidget._store[el.id].tooltipElement;

  self._makeDataAccessors = function() {
    for (let key of Object.keys(properties)) {
      let property = properties[key];
      if (typeof property === "object" && property.dataAccessor !== undefined) {
        properties[key] = makeDataAccessor(key, property.dataAccessor);
      }
    }
  };

  self._setShinyCallback = function() {
    if (HTMLWidgets.shinyMode) {
      properties.onClick = info => {
        let data = { lng: info.lngLat[0], lat: info.lngLat[1], object: info.object };
        Shiny.onInputChange(el.id + "_onclick", data);
      };
    }
  };

  self._setTooltip = function() {
    if (properties.getTooltip) {
      properties.onHover = ({ x, y, object }) => {
        if (!object) {
          tooltipElement.innerHTML = "";
          return;
        }

        let text = properties.getTooltip(object);
        if (!properties.fixedTooltip) {
          tooltipElement.style.top = y + "px";
          tooltipElement.style.left = x + "px";
        }

        tooltipElement.innerHTML = text;
      };
    }
  };

  self._flipData = function() {
    if (properties.dataframeToD3) {
      layer.data = HTMLWidgets.dataframeToD3(layer.data);
    }
  };

  self.render = function() {
    self._makeDataAccessors();
    self._setShinyCallback();
    self._setTooltip();
    self._flipData();
    properties.data = layer.data;
    return new deck[layer.className](properties);
  };
}
