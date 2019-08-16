import makeDataAccessor from "./helpers/make-data-accessor";

export default function(widgetElement, layer) {
  const properties = layer.properties;
  // const tooltipElement = _deckGLWidget._store[widgetElement.id].tooltipElement;
  const tooltipElement = widgetElement._store.tooltipElement;

  const _makeDataAccessors = () => {
    for (let key of Object.keys(properties)) {
      let property = properties[key];
      if (typeof property === "object" && property.dataAccessor !== undefined) {
        properties[key] = makeDataAccessor(key, property.dataAccessor);
      }
    }
  };

  const _setShinyCallback = () => {
    if (HTMLWidgets.shinyMode) {
      properties.onClick = info => {
        let data = { lng: info.lngLat[0], lat: info.lngLat[1], object: info.object };
        Shiny.onInputChange(widgetElement.id + "_onclick", data);
      };
    }
  };

  const _setTooltip = () => {
    const getTooltip = properties.getTooltip;
    const fixedTooltip = properties.fixedTooltip;
    if (getTooltip) {
      properties.onHover = ({ x, y, object }) => {
        if (!object) {
          tooltipElement.innerHTML = "";
          return;
        }

        let text = getTooltip(object);
        if (!fixedTooltip) {
          tooltipElement.style.top = y + "px";
          tooltipElement.style.left = x + "px";
        }

        tooltipElement.innerHTML = text;
      };
    }
  };

  const _flipData = () => {
    if (properties.dataframeToD3) {
      layer.data = HTMLWidgets.dataframeToD3(layer.data);
    }
  };

  _makeDataAccessors();
  _setShinyCallback();
  _setTooltip();
  _flipData();
  properties.data = layer.data === null ? widgetElement._store.data : layer.data;
  return properties;
}
