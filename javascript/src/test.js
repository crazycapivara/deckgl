import deckGLWidget from "./deckgl-widget";

const WIDGET_DATA = {
  "it": "works"
};

const widgetElement = document.getElementById("widget");
const widget = deckGLWidget(widgetElement);
widget.renderValue(WIDGET_DATA);
