var deck = window.deck;

(function() {"use strict"; // anonymos start

  var deckglWidget = window.deckglWidget = {};

  var newLayer = function(className, properties) {
    return new deck[className](properties);
  };

  var tests = {};

  tests.textLayer = function() {
    const textData = "https://raw.githubusercontent.com/uber-common/deck.gl-data/master/website/bart-stations.json";
    return newLayer("TextLayer", {
      id: "text-layer",
      data: textData,
      getText: d => d.name,
      getPosition: d => d.coordinates,
      getSize: 32
    });
  };

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

  methods.addHelloWorldExample = function(text) {
    this.setProps({
      layers: [
        helloWorld.scatterplotLayer(),
        helloWorld.textLayer(text)
      ]
    });
  };

  HTMLWidgets.widget({

    name: 'deckgl',

    type: 'output',

    factory: function(el, width, height) {

      // TODO: define shared variables for this instance
      deckglWidget.element = el;

      var deckgl = null;

      return {

        renderValue: function(x) {

          // TODO: code to render the widget, e.g.
          //el.innerText = x.message;

          console.log("deck.gl version: " + deck.version);

          deckglWidget.deckgl = deckgl = new deck.DeckGL({
            container: el.id,
            longitude: x.longitude,
            latitude: x.latitude,
            zoom: x.zoom || 12,
            layers: []
          });

          if (x.message) {
            methods.addHelloWorldExample.apply(deckgl, [ x.message ]);
            return;
          }

          //deckglWidget.l = tests.textLayer();
          //deckgl.setProps({ layers: [ deckglWidget.l ] });

          deckglWidget.layers = x.layers.map(function(item) {
            console.log(item);
            return newLayer(item.className, item.properties);
          });

          deckgl.setProps({ layers: deckglWidget.layers });

        },

        resize: function(width, height) {

          // TODO: code to re-render the widget with a new size

        }

      };
    }
  });

})(); // anonymos end
