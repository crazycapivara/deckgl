import R2DeckGL from "./r2deckgl";

var r2DeckGL = new R2DeckGL();
var el = document.getElementById("widget");
el.innerHTML = r2DeckGL.renderValue();
