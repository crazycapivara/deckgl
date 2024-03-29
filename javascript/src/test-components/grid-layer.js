import _data from "./data/sf-bike-parking";

const SOURCE_ID = "data-grid-layer";
const LAYER_ID = "grid-layer";

const source = {
  id: SOURCE_ID,
  data: "https://raw.githubusercontent.com/uber-common/deck.gl-data/master/website/sf-bike-parking.json"
};

const GRID_LAYER = {
  className: "GridLayer",
  // source: SOURCE_ID,
  data: _data, //source.data,
  properties: {
    id: LAYER_ID,
    // data: source.data,
    pickable: true,
    extruded: true,
    cellSize: 200,
    elevationScale: 4,
    //getPosition: "@=COORDINATES",// d => d.COORDINATES,
    getPosition: "@=[lng, lat]",
    getColorWeight: "@=2",
    // onClick: ({ object }) => console.log(object)
    // getTooltip: object => object.count
    getTooltip: {
      html: "Count: {{count}}",
      style: "background: blue; color: white",
      // eventType: "onClick"
    },
    colorRange: [ "green", "yellow", "red", "steelblue", "purple", "white" ],
    filter: "racks > 2"
  }
};

const LEGEND_ARGS = {
  items: [
    { color: "steelblue", label: 100 },
    { color: "red", label: 200 }
  ],
  title: "Legend",
  pos: "top-right",
  style: "background: yellow; width: 100px;"
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
    { funcName: "addSource", args: source },
    { funcName: "addLayer", args: GRID_LAYER },
    { funcName: "addJSONEditor", args: {
      options: { maxLines: 15, wrap: 40 },
      style: "width: 400px;",
      theme: "textmate"
    } },
    { funcName: "setViewState", args: { latitude: 37.8, longitude: -122.45, zoom: 12, pitch: 60} }
  ]
};
