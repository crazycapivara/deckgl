import makeDataAccessor from "./helpers/make-data-accessor";
import { makeTooltipElement, setTooltipProp } from "./tooltip";

global._deckGLWidget = global._deckGLWidget || {};
const _deckGLWidget = global._deckGLWidget;

function logVersions() {
  console.log("deck.gl version: " + deck.version);
  if (typeof mapboxgl !== "undefined") {
    console.log("mapbox-gl version: " + mapboxgl.version);
  }
}

function makeDeck(elementId, props) {
  props.container = elementId;
  return new deck.DeckGL(props);
}

function makeLayer(deckGL, className, props) {
  if (props.df) {
    props.data = HTMLWidgets.dataframeToD3(props.data);
  }

  // Make simple data accessors
  for (let key of Object.keys(props)) {
    const prop = props[key];
    if (prop.dataAccessor) {
      props[key] = makeDataAccessor(key, prop.dataAccessor);
    }
  }

  setTooltipProp(deckGL, props);

  if (HTMLWidgets.shinyMode) {
    props.onClick = info => {
      const data = { lng: info.lngLat[0], lat: info.lngLat[1], object: info.object };
      const widgetId = deckGL.props.container;
      Shiny.onInputChange(widgetId + "_onclick", data);
    };
  }

  return new deck[className](props);
}

export default function(widgetElement, width, height) {
  const widget = {};

  let deckGL = null;

  widget.renderValue = (widgetData) => {
    console.log("widget data", widgetData);
    logVersions();
    const store = _deckGLWidget[widgetElement.id] = {};
    deckGL = store.deckGL = makeDeck(widgetElement.id, widgetData.deckGLProperties);
    deckGL._deckGLWidget = {
      sources: {}
    };
    makeTooltipElement(widgetElement);
    const layers = store.layers = widgetData.layerDefs
      .map(layerDef => makeLayer(deckGL, layerDef.className, layerDef.properties));
    deckGL.setProps({ layers: layers });
  };

  widget.resize = (width, height) => {};

  widget.getDeckGL = () => deckGL;

  return widget;
}
