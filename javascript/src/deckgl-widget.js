import "../styles/default.css";

import Viz from "./viz";
import {
  createControlGroups,
  createTooltip,
  addControl,
  addLegend } from "./controls";
import {
  createDeckGLProperties,
  logVersions,
  fixLayerProperties,
  convertColor } from "./utils";
import addJSONEditor from "./json-editor";

if (!global._deckWidget) {
  global._deckWidget = {
    convertColor
  };
}

const funcs = {
  addControl,
  addLegend,
  addJSONEditor
};

export default function(widgetElement, width, height) {
  let deckGL = null;
  let viz = null;

  // Used to debug
  const globalStorage = _deckWidget[widgetElement.id] = { };

  function renderValue(widgetData) {
    widgetData.container = widgetElement.id;
    const sources = widgetData.sources ? parseSources(widgetData.sources) : [ ];
    const layerDefs = widgetData.layers;
    const calls = widgetData.calls || [ ];
    console.log(widgetData);
    logVersions();

    const deckGLProperties = createDeckGLProperties(widgetData);
    deckGL = new deck.DeckGL(deckGLProperties);
    createControlGroups(widgetElement);
    createTooltip(widgetElement);
    viz = globalStorage.viz = Viz({ deckGL, layerDefs, sources, widgetElement });
    calls.forEach(({ funcName, args }) => funcs[funcName].call(viz, args));
    viz.render();
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
      viz.setLayerDefs(widgetData.layers);
      viz.render();
    });
  }

  return { renderValue, resize };
}

const parseSources = (sources) => sources.map(({ id, data, df }) => {
  if (df) data = HTMLWidgets.dataframeToD3(data);

  return { id, data };
});
