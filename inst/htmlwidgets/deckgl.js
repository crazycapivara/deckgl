var deck = window.deck;

(function() {"use strict"; // anonymos start

  var deckglWidget = window.deckglWidget = {};

  var helloWorld = {};

  helloWorld.scatterplotLayer = function() {
    var data = [ { coordinates: [-122.45, 37.8] } ];
    return new deck.ScatterplotLayer({
      id: "points",
      data: data,
      getPosition: d => d.coordinates,
      getRadius: d => 1400,
      getColor: d => [255, 140, 0]
    });
  };

  helloWorld.textLayer = function(text) {
    var data = [ { position: [-122.45, 37.8], text: text } ];
    return new deck.TextLayer({
      id: "text",
      data: data
    });
  };

  var methods = {};

  methods.addHelloWorld = function() {

  };

  HTMLWidgets.widget({

    name: 'deckgl',

    type: 'output',

    factory: function(el, width, height) {

      // TODO: define shared variables for this instance
      var deckgl = null;

      return {

        renderValue: function(x) {

          // TODO: code to render the widget, e.g.
          //el.innerText = x.message;

          console.log("deck.gl version: " + deck.version);

          deckglWidget.deckgl = deckgl = new deck.DeckGL({
            container: el.id,
            longitude: -122.45,
            latitude: 37.8,
            zoom: 12,
            layers: []
          });

          deckgl.setProps({
            layers: [
              helloWorld.scatterplotLayer(),
              helloWorld.textLayer(x.message)
            ]
          });

        },

        resize: function(width, height) {

          // TODO: code to re-render the widget with a new size

        }

      };
    }
  });

})(); // anonymos end
