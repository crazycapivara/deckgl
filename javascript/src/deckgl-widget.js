import makeDeck from "./make-deck";
import makeLayers from "./make-layers";
import fixProperties from "./helpers/fix-properties";
import hexColorToRGBArray from "./helpers/hex-color-to-rgb-array";

const _deckGLWidget = global._deckGLWidget = {};
_deckGLWidget.colorToRGBArray = hexColorToRGBArray;

export default function(el, width, height) {
  console.log("I am your DeckGLWidget!");

  var self = this;

  var deckGL = null;

  self.renderValue = function(x) {
    self._logVersions();
    console.log("el", el, "x", x);
    _deckGLWidget.element = el;
    self._createTooltipElement();
    deckGL = _deckGLWidget.deckGL = makeDeck(el, x);
    var layers = _deckGLWidget.layers = makeLayers(el, x.layers);
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
    var tooltipElement = _deckGLWidget.tooltipElement = document.createElement("div");
    tooltipElement.id = "tooltip";
    el.appendChild(tooltipElement);
  };
}

if (HTMLWidgets.shinyMode) {
  Shiny.addCustomMessageHandler('proxythis', function(data) {
    console.log(data);
    var widget = HTMLWidgets.find("#" + data.id);
    var deckGL = widget.getDeckGL();
    console.log("deckGL", deckGL);
    var el = document.getElementById(data.id);
    fixProperties(data.x.layers);
    var layers = makeLayers(el, data.x.layers);
    console.log(layers);
    deckGL.setProps({ layers: layers });
  });
}
