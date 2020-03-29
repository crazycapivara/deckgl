import {
  createDeckGLProperties,
  logVersions,
  fixLayerProperties } from "./utils";
import deckLayer from "./layer";

export default function(widgetElement, width, height) {
  const widget = { };

  let deckGL = null;

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

  widget.renderValue = function(widgetData) {
    console.log(widgetData);
    logVersions();

    const deckGLProperties = createDeckGLProperties(widgetElement.id, widgetData);
    deckGL = new deck.DeckGL(deckGLProperties);
    _render(widgetData.layers);
  };

  widget.resize = function(width, height) {
    // not implemented yet
  };

  if (HTMLWidgets.shinyMode) {
    Shiny.addCustomMessageHandler('proxythis', function(obj) {
      // console.log(obj);
      const widgetData = obj.x;
      fixLayerProperties(widgetData.layers);
      console.log(widgetData);
      _render(widgetData.layers);
    });
  }

  return widget;
}
