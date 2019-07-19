import makeDataAccessor from "./helpers/make-data-accessor";

export default function(el, layers) {
  return layers.map(function(item) {
    const properties = item.properties;
    makeDataAccessors(properties);
    if (properties.dataframeToD3) {
      item.data = HTMLWidgets.dataframeToD3(item.data);
    }

    if (HTMLWidgets.shinyMode) {
      properties.onClick = function(info) {
        const data = { lng: info.lngLat[0], lat: info.lngLat[1], object: info.object };
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

const makeDataAccessors = function(properties) {
  for (let key of Object.keys(properties)) {
    var property = properties[key];
    if (typeof property === "object" && property.dataAccessor !== undefined) {
      console.log(key, "make data accessor");
      properties[key] = makeDataAccessor(property.dataAccessor);
    }
  }
};

const addTooltipTo = function(properties) {
  properties.onHover = function({ x, y, object }) {
    const tooltipElement = _deckGLWidget.tooltipElement;
    if (!object) {
      tooltipElement.innerHTML = "";
      return;
    }

    const text = properties.getTooltip(object);
    if (!properties.fixedTooltip) {
      tooltipElement.style.top = y + "px";
      tooltipElement.style.left = x + "px";
    }

    tooltipElement.innerHTML = text;
  };
};
