import parseLayerProps from "./layer";

const Viz = ({ deckGL, layerDefs, sources, widgetElement }) => ({
  deckGL,
  layerDefs,
  sources,
  widgetElement,

  _getContainer() {
    return this.deckGL.props.container;
  },

  setLayerDefs(layerDefs) {
    this.layerDefs = layerDefs;
  },

  render() {
    const layers = this.layerDefs.map(layerDef => {
      /*
      if (layerDef.properties.dataframeToD3) {
        layerDef.data = HTMLWidgets.dataframeToD3(layerDef.data);
        layerDef.properties.dataframeToD3 = false;
      }
      */
      /*
      if (layerDef.source.df) {
        layerDef.source.data = HTMLWidgets.dataframeToD3(layerDef.source.data);
        layerDef.source.df = false;
      }
      */

      layerDef.properties.data = this.sources.filter(source =>
        source.id === layerDef.source)[0].data; //layerDef.source.data;
      const props = parseLayerProps(layerDef.properties, this.widgetElement);
      return new deck[layerDef.className](props);
    });
    this.deckGL.setProps({ layers: layers });
  }
});

export default Viz;
