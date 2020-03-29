import deckGLWidget from "./deckgl-widget";

const WIDGET_DATA = {
  latitude: 37.8,
  longitude: -122.45,
  zoom: 12,
  pitch: 0,
  bearing: 0,
  layers: [ ],
  mapStyle: "https://basemaps.cartocdn.com/gl/dark-matter-gl-style/style.json"
};

const widgetElement = document.getElementById("widget");
const widget = deckGLWidget(widgetElement);
widget.renderValue(WIDGET_DATA);
