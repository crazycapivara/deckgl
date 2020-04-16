import parseLayerProps from "./layer";

const Viz = ({ deckGL, layerDefs, widgetElement }) => ({
  deckGL,
  layerDefs,
  widgetElement,
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

  setLayerDefs(layerDefs) {
    this.layerDefs = layerDefs;
  },

  render() {
    const layers = this.layerDefs.map(layerDef => {
      layerDef.properties.data = this.getSource(layerDef.source);
      const props = parseLayerProps(layerDef.properties, this.widgetElement);
      return new deck[layerDef.className](props);
    });
    this.deckGL.setProps({ layers: layers });
  }
});

export default Viz;
