import deckGLWidget from "./deckgl-widget";
import widget_data from "./test-components/path-layer";

global.HTMLWidgets = { };

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
      // fixed: true
    },
    getColor: "blue",
    getStrokeColor: d => "black"
  }
};

const WIDGET_DATA = {
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
    { funcName: "addControl", args: [ "I scream for icecream!", "top-right" ] },
    { funcName: "addControl", args: [ "Down by Law", "top-right" ] },
    { funcName: "addControl", args: [ "Test", "top-left" ] }
  ]
};

const widgetElement = document.getElementById("widget");
const widget = deckGLWidget(widgetElement);
widget.renderValue(widget_data);
