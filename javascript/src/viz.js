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
      // TODO: ... could be done in 'setLayers'
      // If 'source' is an id there should be no data prop
      // Problem we must check whether the string is an url or a source id
      // This must be done on R side, because it always creates a source object at the moment
      const data = layer.source.data;
      layer.properties.data = typeof data === "string" && this.sources.hasOwnProperty(data) ?
        this.getSource(data) : data;
      const props = parseLayerProps(layer.properties, this.widgetElement);
      return new deck[layer.className](props);
    });
    this.deckGL.setProps({ layers: deckLayers });
  }
});

export default Viz;
