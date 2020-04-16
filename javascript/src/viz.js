import parseLayerProps from "./layer";

const Viz = ({ deckGL, widgetElement }) => ({
  deckGL,
  widgetElement,
  layers: [ ],
  sources: [ ],

  _getContainer() {
    return this.deckGL.props.container;
  },

  addSource({ id, data, df }) {
    if (df) data = HTMLWidgets.dataframeToD3(data);
    this.sources.push({ id, data });
  },

  getSource(source_id) {
    return this.sources.filter(source =>
        source.id === source_id)[0].data;
  },

  setLayers(layers) {
    this.layers = layers;
  },

  render() {
    const deckLayers = this.layers.map(layer => {
      layer.properties.data = this.getSource(layer.source);
      const props = parseLayerProps(layer.properties, this.widgetElement);
      return new deck[layer.className](props);
    });
    this.deckGL.setProps({ layers: deckLayers });
  }
});

export default Viz;
