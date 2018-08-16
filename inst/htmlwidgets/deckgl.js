var deck = window.deck;

(function() {"use strict"; // anonymos start

  var deckglWidget = window.deckglWidget = {};

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

          var sampleDataPoints = [ { coordinates: [-122.45, 37.8] } ];
          var sampleDataText = [ { position: [-122.45, 37.8], text: "Hello World"} ];

          deckglWidget.deckgl = deckgl = new deck.DeckGL({
            container: el.id,
            longitude: -122.45,
            latitude: 37.8,
            zoom: 12,
            layers: [
              new deck.ScatterplotLayer({
                id: "points",
                data: sampleDataPoints,
                getPosition: d => d.coordinates,
                getRadius: d => 1200,
                getColor: d => [255, 140, 0]
              }),
              new deck.TextLayer({
                id: "text",
                data: sampleDataText
              })
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
