import DeckGLWidget from "./deckgl-widget";

HTMLWidgets.widget({
  name: "deckgl",
  type: "output",
  factory: function(el, width, height) {
    var deckGLWidget = new DeckGLWidget(el, width, height);
    return {
      renderValue: deckGLWidget.renderValue,
      resize: deckGLWidget.resize,
      getDeckGL: deckGLWidget.getDeckGL
    };
  }
});
