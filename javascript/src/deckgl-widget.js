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

  function _render() {

  }

  widget.renderValue = function(widgetData) {
    console.log(widgetData);
    // widgetElement.innerHTML = "deckgl-widget";

    const deckGLProperties = createDeckGLProperties(widgetElement.id, widgetData);
    deckGL = new deck.DeckGL(deckGLProperties);
  };

  widget.resize = function(width, height) {
    // not implemented yet
  };

  return widget;
}
