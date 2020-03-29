import deckGLWidget from "./deckgl-widget";

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
    getTooltip: object => object.count
  }
};

const WIDGET_DATA = {
  latitude: 37.8,
  longitude: -122.45,
  zoom: 12,
  pitch: 35,
  bearing: 0,
  layers: [ GRID_LAYER ],
  mapStyle: "", //"https://basemaps.cartocdn.com/gl/dark-matter-gl-style/style.json"
};

const widgetElement = document.getElementById("widget");
const widget = deckGLWidget(widgetElement);
widget.renderValue(WIDGET_DATA);
