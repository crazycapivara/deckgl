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
  constructor(widgetElement, width, height) {
    console.log("I am your DeckGLWidget!");
    widgetElement._store = {};
    this.widgetElement = widgetElement;
    this.width = width;
    this.height = height;
    this._widgetStore = _deckGLWidget._store[widgetElement.id] = {};
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
    this.widgetElement._store.tooltipElement = tooltipElement; // NEW
    tooltipElement.id = this.widgetElement.id + "-tooltip";
    tooltipElement.className = "tooltip";
    this.widgetElement.appendChild(tooltipElement);
  }

  // TODO: Rename x
  renderValue(widgetData) {
    this._logVersions();
    console.log("widgetElement", this.widgetElement, "widgetData", widgetData);
    this._widgetStore.element = this.widgetElement;
    this._createTooltipElement();
    this.deckGL = this._widgetStore.deckGL = makeDeck(this.widgetElement, widgetData);
    const layers = this._widgetStore.layers = makeLayers(this.widgetElement, widgetData.layers);
    this.deckGL.setProps({ layers: layers });
  }

  resize(width, height) { }

  getDeckGL() {
    return this.deckGL;
  }
}

// TODO: Rename 'proxythis', and 'x' (needs to be renamed on R side as well)
if (HTMLWidgets.shinyMode) {
  Shiny.addCustomMessageHandler('proxythis', function(data) {
    console.log(data);
    const widget = HTMLWidgets.find("#" + data.id);
    const deckGL = widget.getDeckGL();
    console.log("deckGL", deckGL);
    const widgetElement = document.getElementById(data.id);
    fixProperties(data.x.layers);
    const layers = makeLayers(widgetElement, data.x.layers);
    console.log(layers);
    deckGL.setProps({ layers: layers });
  });
}
