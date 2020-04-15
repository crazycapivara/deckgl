const DEFAULT_OPTIONS = {
  mode: "code",
  search: false,
  mainMenuBar: false,
  navigationBar: false,
  /*
  onEvent: (obj, e) => {
    if (e.type === "blur") console.log("Here we go");
  }
  */
  onChangeText: (text) => {
    try {
      const obj = JSON.parse(text);
      console.log(obj);
    } catch (e) {
      // console.log(e);
    }
  }
};

export default function(options) {
  const viz = this;
  const container = document.createElement("div");
  container.id = "deckgl-widget-code-ctrl";
  const editor = _deckWidget.editor = new JSONEditor(container, Object.assign(DEFAULT_OPTIONS, options || { }));
  // container.children[0].style.cssText = "border: none;";
  document.body.append(container);
  if (viz) {
    const layerProps = viz.layerDefs.map(layerDef => layerDef.properties);
    editor.set({ layers: layerProps });
    editor.options.onChangeText = render(viz);
    viz.editor = editor;
  }

  return editor;
}

function render(viz) {
  return (text) => {
    try {
      const obj = JSON.parse(text);
      // console.log(obj.layers);
      viz.layerDefs.map((layerDef, i) => Object.assign(layerDef.properties, obj.layers[i]));
      // console.log(viz.layerDefs);
      viz.render();
    } catch (e) {
      // console.log("error", e);
    }
  };

}
