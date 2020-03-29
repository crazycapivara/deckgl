import deckLayer from "./layer";

// TODO: Use 'deckGLProperties' parameter in R
function createDeckGLProperties(elementId, widgetData) {
   return Object.assign({
     mapboxApiAccessToken: widgetData.mapboxApiAccessToken || "",
     mapStyle: widgetData.mapStyle || "",
     container: elementId,
     initialViewState: widgetData.initialViewState || createInitialViewState(widgetData),
     views: widgetData.views || new deck.MapView(),
     controller: true,
     layers: [ ]
   }, widgetData.properties);
}

// TODO: Create initial view state already in R
function createInitialViewState(widgetData) {
  return {
    longitude: widgetData.longitude,
    latitude: widgetData.latitude,
    zoom: widgetData.zoom,
    pitch: widgetData.pitch,
    bearing: widgetData.bearing
  };
}

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
    // widgetElement.innerHTML = "deckgl-widget";

    const deckGLProperties = createDeckGLProperties(widgetElement.id, widgetData);
    deckGL = new deck.DeckGL(deckGLProperties);
    _render(widgetData.layers);
  };

  widget.resize = function(width, height) {
    // not implemented yet
  };

  return widget;
}
