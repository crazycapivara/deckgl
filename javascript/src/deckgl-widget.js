import "../styles/default.css";

import {
  createControls,
  addControl,
  addLegend } from "./controls";
import {
  createDeckGLProperties,
  logVersions,
  fixLayerProperties,
  convertColor } from "./utils";
//import deckLayer from "./layer";
import parseLayerProps from "./layer";

if (!global._deckWidget) {
  global._deckWidget = {
    convertColor
  };
}

const funcs = {
  addControl,
  addLegend
};

export default function(widgetElement, width, height) {
  let deckGL = null;
  let _layerDefs = null;
  const globalStorage = _deckWidget[widgetElement.id] = { };

  function _render(layerDefs) {
    const layers = _layerDefs.map(layerDef => {
      if (layerDef.properties.dataframeToD3) {
        layerDef.data = HTMLWidgets.dataframeToD3(layerDef.data);
      }

      layerDef.properties.data =  layerDef.data;
      //return deckLayer(layerDef.className, layerDef.properties, widgetElement);
      const props = parseLayerProps(layerDef.properties, widgetElement);
      return new deck[layerDef.className](props);
    });
    deckGL.setProps({ layers: layers });
  }

  globalStorage.render = _render;

  function renderValue(widgetData) {
    widgetData.container = widgetElement.id;
    const calls = widgetData.calls || [ ];
    console.log(widgetData);
    logVersions();

    const deckGLProperties = createDeckGLProperties(widgetData);
    _layerDefs = globalStorage.layers = widgetData.layers;
    deckGL = globalStorage.deckGL = new deck.DeckGL(deckGLProperties);
    createControls(widgetElement);
    //_render(widgetData.layers);
    _render();
    calls.forEach(({ funcName, args }) => funcs[funcName].apply(null, args));
  }

  function resize(width, height) {
    // not implemented yet
  }

  if (HTMLWidgets.shinyMode) {
    Shiny.addCustomMessageHandler('proxythis', function(obj) {
      // console.log(obj);
      const widgetData = obj.x;
      fixLayerProperties(widgetData.layers);
      console.log(widgetData);
      _render(widgetData.layers);
    });
  }

  return { renderValue, resize };
}
