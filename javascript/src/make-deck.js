export default function(el, x) {
  var properties = {
    mapboxApiAccessToken: x.mapboxApiAccessToken || "",
    mapStyle: x.mapStyle || "",
    container: el.id,
    initialViewState: x.initialViewState || makeInitialViewState(x),
    views: x.views || new MapView(),
    layers: []
  };
  properties = Object.assign(properties, x.properties);
  return new deck.DeckGL(properties);
}

var makeInitialViewState = function(x) {
  return {
    longitude: x.longitude,
    latitude: x.latitude,
    zoom: x.zoom,
    pitch: x.pitch,
    bearing: x.bearing
  };
};
