import makeDeck from "./make-deck";
import makeLayers from "./make-layers";

global._deckGLWidget = {};

export default function(el, width, height) {
  console.log("I am your DeckGLWidget!");

  self = this;

  var deckGL = null;

  self.renderValue = function(x) {
    self._logVersions();
    console.log("el", el, "x", x);
    _deckGLWidget.element = el;
    self._createTooltipElement();
    deckGL = _deckGLWidget.deckGL = makeDeck(el, x);
    var layers = _deckGLWidget.layers = makeLayers(x.layers);
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
