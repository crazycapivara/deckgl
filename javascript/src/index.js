import DeckGLWidget from "./deckgl-widget";

HTMLWidgets.widget({
  name: "deckgl",
  type: "output",
  factory: (el, width, height) => new DeckGLWidget(el, width, height)
});
