import parseLayerProps from "./layer";
import { convertExpression } from "./utils";

const Viz = ({ deckGL, widgetElement }) => ({
  deckGL,
  widgetElement,
  layers: [ ],
  sources: [ ],

  getContainer() {
    return this.deckGL.props.container;
  },

  addLayer(layer) {
    this.layers.push(layer);
  },

  // TODO: If 'source' is an id it should not be stored in the 'data' property of the source
  // At the moment this is done because of the R part.
  // In R there should be a function like 'use_source' to specify that the source is an id,
  // because a string could also be an url.
  /*
  _getData(source) {
    let data = source.data;
    if (typeof data === "string" && this.sources.map(source => source.id).includes(data)) {
      data = this.getSource(data).data;
    }

    return data;
  },
  */

  addSource(source) {
    this.sources.push(source);
  },

  getSource(id) {
    return this.sources.filter(source => source.id === id)[0];
  },

  setLayers(layers) {
    layers.forEach(layer => {
      if (layer.convertData) layer.data = HTMLWidgets.dataframeToD3(layer.data);
    });
    this.layers = layers;
  },

  render() {
    const deckLayers = this.layers.map(layer => {
      // layer.properties.data = layer.source ? this.getSource(layer.source).data : layer.data;
      const data = layer.source ? this.getSource(layer.source).data : layer.data;
      // console.log("d", data);
      layer.properties.data = typeof data === "object" && layer.properties.filter
        ? data.filter(convertExpression(layer.properties.filter))
        //? data.filter(row => row.racks > 7)
        : data;
      const props = parseLayerProps(layer.properties, this.widgetElement);
      return new deck[layer.className](props);
    });
    this.deckGL.setProps({ layers: deckLayers });
  }
});

export default Viz;
