// TODO: Use 'deckGLProperties' parameter in R
export function createDeckGLProperties(elementId, widgetData) {
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

export function logVersions() {
  console.log("deck.gl", deck.version);
  if (typeof mapboxgl !== "undefined") console.log("mapbox-gl", mapboxgl.version);
}
