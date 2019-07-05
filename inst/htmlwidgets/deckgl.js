var deck = window.deck;

(function() {"use strict"; // anonymos start

  var deckglWidget = window.deckglWidget = {};

  // TODO: Remove, see function below
  /*
  deckglWidget.tileLayer = function() {
    return new deck.TileLayer({
      pickable: true,
      opacity: 1,
      minZoom: 0,
      maxZoom: 19,
      renderSubLayers: function(props) {
        // const tileServer = 'https://c.tile.openstreetmap.org/';
        const tileServer = "http://a.tile.stamen.com/toner/";
        const {x, y, z, bbox} = props.tile;
        const {west, south, east, north} = bbox;

        return new deck.BitmapLayer(props, {
          image: `${tileServer}/${z}/${x}/${y}.png`,
          bounds: [west, south, east, north]
        });
      }
    });
  };
  */

  deckglWidget.colorToRGBArray = function(color) {
    color = color.substring(1); // remove '#'
    return [
      parseInt(color.substring(0, 2), 16),
      parseInt(color.substring(2, 4), 16),
      parseInt(color.substring(4), 16)
    ];
  };

  deckglWidget.renderMapTiles = function(props) {
    const tileServer = props.tileServer || "http://a.tile.stamen.com/toner/";
    const { x, y, z, bbox } = props.tile;
    const { west, south, east, north } = bbox;

    return new deck.BitmapLayer(props, {
      image: `${tileServer}/${z}/${x}/${y}.png`,
      bounds: [ west, south, east, north ]
    });
  };

  var newLayer = function(className, properties) {
    // Pass data back to R in 'shinyMode'
    if (HTMLWidgets.shinyMode) {
      // console.log("Shiny mode");
      properties.onClick = function(info) {
        // console.log(info);
        var data = { lng: info.lngLat[0], lat: info.lngLat[1], object: info.object };
        // console.log(data);
        Shiny.onInputChange(deckglWidget.element.id + "_onclick", data);
      };
    }

    if (properties.getTooltip) {
      properties.onHover = function({x, y, object}) {
        var tooltipElement = deckglWidget.tooltipElement;
        if (!object) {
          tooltipElement.innerHTML = "";
          return;
        }

        // console.log(x, y, object);
        var text = properties.getTooltip(object);
        if (!properties.fixedTooltip) {
          tooltipElement.style.top = y + "px";
          tooltipElement.style.left = x + "px";
        }

        tooltipElement.innerHTML = text;
      };
    }

    return new deck[className](properties);
  };

  var initialViewState = function(x) {
    return {
      longitude: x.longitude,
      latitude: x.latitude,
      zoom: x.zoom,
      pitch: x.pitch,
      bearing: x.bearing
    };
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
      el.appendChild(tooltipElement);

      var deckgl = null;

      return {

        renderValue: function(x) {

          // Render the widget

          console.log("deck.gl version: " + deck.version);
          if (typeof mapboxgl !== "undefined") {
            console.log("mapbox-gl version: " + mapboxgl.version);
          }

          var properties = {
            mapboxApiAccessToken: x.mapboxApiAccessToken || "",
            mapStyle: x.mapStyle || "",
            container: el.id,
            initialViewState: x.initialViewState || initialViewState(x),
            views: x.views || new MapView(),
            layers: []
          };

          properties = Object.assign(properties, x.properties);

          deckglWidget.deckgl = deckgl = new deck.DeckGL(properties);

          deckglWidget.layers = x.layers.map(function(item) {
            if (item.properties.dataframeToD3) {
              item.data = HTMLWidgets.dataframeToD3(item.data);
            }

            item.properties.data = item.data;
            // console.log(item);
            return newLayer(item.className, item.properties);
          });

          // test tile layer
          // deckglWidget.layers.push(deckglWidget.tileLayer());

          deckgl.setProps({ layers: deckglWidget.layers });

        },

        getDeck: function() {
          return deckgl;
        },

        resize: function(width, height) {

          // TODO: code to re-render the widget with a new size

        }

      };
    }
  });

  var getWidget = function(id) {
    var htmlWidgetsObj = HTMLWidgets.find("#" + id);
    return htmlWidgetsObj.getDeck();
  };

  if (HTMLWidgets.shinyMode) {
    Shiny.addCustomMessageHandler('proxythis', function(obj) {
      console.log(obj);
      var deckgl = getWidget(obj.id);
      console.log(deckgl);
      var layers = makeLayers(obj.x.layers);
      deckgl.setProps({ layers: layers });
      console.log(deckglWidget.deckgl);
    });
  }

  var makeLayers = function(layers) {
    var l = deckglWidget.layers = layers.map(function(item) {
      if (item.properties.dataframeToD3) {
        item.data = HTMLWidgets.dataframeToD3(item.data);
      }

      item.properties.data = item.data;
      return newLayer(item.className, item.properties);
    });
    return l;
  };

})(); // anonymos end
