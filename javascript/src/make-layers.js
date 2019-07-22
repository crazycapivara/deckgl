// import LayerBuilder from "./layer-builder";
/*
import LayerBuilder from "./layer-builder-class";

export default function(el, layers) {
  return layers.map(layer => {
    let layerBuilder = new LayerBuilder(el, layer);
    return layerBuilder.render();
  });
}
*/

import makeLayerProperties from "./make-layer-properties";

export default function(el, layers) {
  return layers.map(layer => {
    let properties = makeLayerProperties(el, layer);
    return new deck[layer.className](properties);
  });
}
