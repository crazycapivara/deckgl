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

export default class {
  constructor(el, width, height) {
    console.log("I am your DeckGLWidget!");
    this.el = el;
    this.width = width;
    this.height = height;
    this._widgetStore = _deckGLWidget._store[el.id] = {};
    this.deckGL = null;
  }

  _logVersions() {
    console.log("deck.gl version: " + deck.version);
    if (typeof mapboxgl !== "undefined") {
      console.log("mapbox-gl version: " + mapboxgl.version);
    }
  }

  _createTooltipElement() {
    const tooltipElement = this._widgetStore.tooltipElement = document.createElement("div");
    tooltipElement.id = this.el.id + "-tooltip";
    tooltipElement.className = "tooltip";
    this.el.appendChild(tooltipElement);
  }

  renderValue(x) {
    this._logVersions();
    console.log("el", this.el, "x", x);
    this._widgetStore.element = this.el;
    this._createTooltipElement();
    this.deckGL = this._widgetStore.deckGL = makeDeck(this.el, x);
    const layers = this._widgetStore.layers = makeLayers(this.el, x.layers);
    this.deckGL.setProps({ layers: layers });
  }

  resize(width, height) { }

  getDeckGL() {
    return this.deckGL;
  }
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
