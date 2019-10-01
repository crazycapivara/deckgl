import makeDeck from "./make-deck";
import makeLayers from "./make-layers";
import fixProperties from "./helpers/fix-properties";
import hexColorToRGBArray from "./helpers/hex-color-to-rgb-array";
import renderMapTiles from "./helpers/render-map-tiles";

const _deckGLWidget = global._deckGLWidget = {
  colorToRGBArray: hexColorToRGBArray,
  renderMapTiles: renderMapTiles,
  _store: {}
};

export default function(el, width, height) {
  console.log("I am your DeckGLWidget!");

  const _widgetStore = _deckGLWidget._store[el.id] = {};

  const self = this;

  var deckGL = null;

  self.renderValue = function(x) {
    self._logVersions();
    console.log("el", el, "x", x);
    _widgetStore.element = el;
    self._createTooltipElement();
    deckGL = _widgetStore.deckGL = makeDeck(el, x);
    const layers = _widgetStore.layers = makeLayers(el, x.layers);
    deckGL.setProps({ layers: layers });
  };

  self.resize = function(width, height) { };

  self.getDeckGL = function() {
    return deckGL;
  };

  self._logVersions = function() {
    console.log("deck.gl version: " + deck.version);
    if (typeof mapboxgl !== "undefined") {
      console.log("mapbox-gl version: " + mapboxgl.version);
    }
  };

  self._createTooltipElement = function() {
    const tooltipElement = _widgetStore.tooltipElement = document.createElement("div");
    tooltipElement.id = el.id + "-tooltip";
    tooltipElement.className = "tooltip";
    el.appendChild(tooltipElement);
  };
}

if (HTMLWidgets.shinyMode) {
  Shiny.addCustomMessageHandler('proxythis', function(data) {
    console.log(data);
    const widget = HTMLWidgets.find("#" + data.id);
    const deckGL = widget.getDeckGL();
    console.log("deckGL", deckGL);
    const el = document.getElementById(data.id);
    fixProperties(data.x.layers);
    const layers = makeLayers(el, data.x.layers);
    console.log(layers);
    deckGL.setProps({ layers: layers });
  });
}
