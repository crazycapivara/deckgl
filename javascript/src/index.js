// import DeckGLWidget from "./deckgl-widget";
import DeckGLWidget from "./deckgl-widget-class";

HTMLWidgets.widget({
  name: "deckgl",
  type: "output",
  factory: (el, width, height) => new DeckGLWidget(el, width, height)
});
