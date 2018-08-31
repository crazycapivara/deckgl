var deck = window.deck;

(function() {"use strict"; // anonymos start

  var deckglWidget = window.deckglWidget = {};

  deckglWidget.colorToRGBArray = function(color) {
    color = color.substring(1); // remove '#'
    return [
      parseInt(color.substring(0, 2), 16),
      parseInt(color.substring(2, 4), 16),
      parseInt(color.substring(4), 16)
    ];
  };

  var newLayer = function(className, properties) {
    if (properties.getTooltip) {
      properties.onHover = function({x, y, object}) {
        var tooltipElement = deckglWidget.tooltipElement;
        if (!object) {
          tooltipElement.innerHTML = "";
          return;
        }

        // console.log(x, y, object);
        var text = properties.getTooltip(object);
        // TODO: add option to use fixed tooltip element
        if (!properties.fixedTooltip) {
          tooltipElement.style.top = y + "px";
          tooltipElement.style.left = x + "px";
        }

        tooltipElement.innerHTML = text;
      };
    }

    return new deck[className](properties);
  };

  // TODO: Remove tests!
  var tests = {};

  tests.textLayer = function() {
    const data = "https://raw.githubusercontent.com/uber-common/deck.gl-data/master/website/bart-stations.json";
    return newLayer("TextLayer", {
      id: "text-layer",
      data: data,
      getText: data => data.name,
      getPosition: data => data.coordinates,
      getSize: 32
    });
  };

  HTMLWidgets.widget({

    name: 'deckgl',

    type: 'output',

    factory: function(el, width, height) {

      // Define shared variables for this instance

      deckglWidget.element = el;

      var tooltipElement = deckglWidget.tooltipElement = document.createElement("div");
      tooltipElement.id = "tooltip";
      // tooltipElement.style.background = "yellow";
      el.appendChild(tooltipElement);
      // tooltipElement.innerHTML = "bender";

      var deckgl = null;

      return {

        renderValue: function(x) {

          // Render the widget

          console.log("deck.gl version: " + deck.version);

          deckglWidget.deckgl = deckgl = new deck.DeckGL({
            mapboxApiAccessToken: x.mapboxApiAccessToken || "",
            mapStyle: x.mapStyle || "",
            container: el.id,
            longitude: x.longitude,
            latitude: x.latitude,
            zoom: x.zoom,
            pitch: x.pitch,
            layers: []
          });

          deckglWidget.layers = x.layers.map(function(item) {
            if (item.properties.dataframeToD3) {
              item.data = HTMLWidgets.dataframeToD3(item.data);
            }
            console.log(item);
            item.properties.data = item.data;
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
