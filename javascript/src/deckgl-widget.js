import makeDeck from "./make-deck";
import makeLayers from "./make-layers";

global._deckGLWidget = {};

export default function(el, width, height) {
  console.log("I am your DeckGLWidget!");

  var deckGL = null;

  this.renderValue = function(x) {
    logVersions();
    console.log("el", el, "x", x);
    _deckGLWidget.element = el;
    var deckGL = _deckGLWidget.deckGL = makeDeck(el, x);
    var layers = _deckGLWidget.layers = makeLayers(x.layers);
    deckGL.setProps({ layers: layers });
  };

  this.resize = function(width, height) {
  };
}

var logVersions = function() {
  console.log("deck.gl version: " + deck.version);
  if (typeof mapboxgl !== "undefined") {
    console.log("mapbox-gl version: " + mapboxgl.version);
  }
};
