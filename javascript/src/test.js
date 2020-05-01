import deckGLWidget from "./deckgl-widget";
// import widget_data from "./test-components/grid-layer";
import widget_data from "./test-components/path-layer";

global.HTMLWidgets = { };

const widgetElement = document.getElementById("widget");
const widget = deckGLWidget(widgetElement);
widget.renderValue(widget_data);
