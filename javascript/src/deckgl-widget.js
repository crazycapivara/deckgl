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
import deckLayer from "./layer";

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
  const globalStorage = _deckWidget[widgetElement.id] = { };

  function _render(layerDefs) {
    const layers = layerDefs.map(layerDef => {
      if (layerDef.properties.dataframeToD3) {
        layerDef.data = HTMLWidgets.dataframeToD3(layerDef.data);
      }

      layerDef.properties.data =  layerDef.data;
      return deckLayer(layerDef.className, layerDef.properties, widgetElement);
    });
    deckGL.setProps({ layers: layers });
  }

  function renderValue(widgetData) {
    widgetData.container = widgetElement.id;
    const calls = widgetData.calls || [ ];
    console.log(widgetData);
    logVersions();

    const deckGLProperties = createDeckGLProperties(widgetData);
    deckGL = globalStorage.deckGL = new deck.DeckGL(deckGLProperties);
    createControls(widgetElement);
    _render(widgetData.layers);
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
