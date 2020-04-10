const PATH_LAYER = {
  className: "PathLayer",
  properties: {
    pickable: true,
    widthScale: 20,
    widthMinPixels: 2,
    getPath: data => data.path,
    getColor: d => d.color, // [25,145, 12],
    getWidth: 5,
    tooltip: { html: "{{name}}" }
  },
  data: "https://raw.githubusercontent.com/uber-common/deck.gl-data/master/website/bart-lines.json"
};

export default {
  latitude: 37.8,
  longitude: -122.45,
  zoom: 10.5,
  pitch: 25,
  bearing: 0,
  layers: [
    PATH_LAYER
  ]
};
