import parseLayerProps from "./layer";

const Viz = ({ deckGL, widgetElement }) => ({
  deckGL,
  widgetElement,
  layers: [ ],
  sources: { },

  _getContainer() {
    return this.deckGL.props.container;
  },

  addSource({ id, data, df }) {
    if (df) data = HTMLWidgets.dataframeToD3(data);
    this.sources[id] = data;
  },

  getSource(id) {
    return this.sources[id];
  },

  setLayers(layers) {
    layers.forEach(layer => {
      const source = layer.source;
      if (typeof source === "object") {
        if (source.df) layer.source.data = HTMLWidgets.dataframeToD3(source.data);
      }
    });
    this.layers = layers;
  },

  render() {
    const deckLayers = this.layers.map(layer => {
      // Check whether 'layer.source' is a source id
      layer.properties.data = (typeof layer.source.data === "string" &&
        this.sources.hasOwnProperty(layer.source.data)) ? this.getSource(layer.source.data) : layer.source.data;
      const props = parseLayerProps(layer.properties, this.widgetElement);
      return new deck[layer.className](props);
    });
    this.deckGL.setProps({ layers: deckLayers });
  }
});

export default Viz;
