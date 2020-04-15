const GRID_LAYER = {
  className: "GridLayer",
  data: "https://raw.githubusercontent.com/uber-common/deck.gl-data/master/website/sf-bike-parking.json",
  properties: {
    id: "grid-layer",
    pickable: true,
    extruded: true,
    cellSize: 200,
    elevationScale: 4,
    getPosition: d => d.COORDINATES,
    // onClick: ({ object }) => console.log(object)
    // getTooltip: object => object.count
    getTooltip: {
      html: "Count: {{count}}",
      style: "background: blue; color: white",
      // eventType: "onClick"
    },
    colorRange: [ "green", "yellow", "red", "steelblue", "purple", "white" ]
  }
};

const LEGEND_ARGS = {
  items: [
    { color: "steelblue", label: 100 },
    { color: "red", label: 200 }
  ],
  title: "Legend",
  pos: "top-right",
  style: "background: yellow;"
};

export default {
  latitude: 37.8,
  longitude: -122.45,
  zoom: 12,
  pitch: 35,
  bearing: 0,
  layers: [
    GRID_LAYER
  ],
  mapStyle: "", //"https://basemaps.cartocdn.com/gl/dark-matter-gl-style/style.json",
  calls: [
    { funcName: "addControl", args: { html: "I scream for icecream!", pos: "top-right" } },
    { funcName: "addControl", args: { html: "Down by Law", pos: "top-right" } },
    { funcName: "addControl", args: { html: "Test", pos: "top-left" } },
    { funcName: "addLegend", args: LEGEND_ARGS },
    { funcName: "addJSONEditor", args: { } }
  ]
};
