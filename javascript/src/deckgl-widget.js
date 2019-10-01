import makeDataAccessor from "./helpers/make-data-accessor";

const _deckGLWidget = global._deckGLWidget = {};

function logVersions() {
  console.log("deck.gl version: " + deck.version);
    if (typeof mapboxgl !== "undefined") {
      console.log("mapbox-gl version: " + mapboxgl.version);
    }
}

function makeTooltipElement(widgetElement) {
  const tooltipElement = document.createElement("div");
  tooltipElement.id = widgetElement.id + "-tooltip";
  tooltipElement.className = "tooltip";
  widgetElement.appendChild(tooltipElement);
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
  makeTooltip(deckGL, props);
  return new deck[className](props);
}

function makeTooltip(deckGL, props) {
  if(!props.getTooltip) return;

  console.log(props.getTooltip);
  const tooltipId = deckGL.props.container + '-tooltip';
  const tooltipElement = document.getElementById(tooltipId);
  tooltipElement.innerHTML = props.getTooltip;
  props.onHover = ({ object, x, y }) => {
    if (object) {
      console.log(object.points.length);
    } else {
      console.log("nothing to do");
    }
  };
}

export default function(widgetElement, width, height) {
  const widget = {};

  let deckGL = null;

  widget.renderValue = (widgetData) => {
    console.log("widget data", widgetData);
    logVersions();
    deckGL = _deckGLWidget.deckGL = makeDeck(widgetElement.id, widgetData.deckGLProperties);
    deckGL._deckGLWidget = {
      sources: {}
    };
    makeTooltipElement(widgetElement);
    const layers = _deckGLWidget.layers = widgetData.layerDefs
      .map(layerDef => makeLayer(deckGL, layerDef.className, layerDef.properties));
    deckGL.setProps({ layers: layers});
  };

  widget.resize = (width, height) => {};

  widget.getDeckGL = () => deckGL;

  return widget;
}
