const DECKGL_OVERLAY = "deckgl-overlay";
const KEY_CODE_E = 69;
const CLASS_NAME_JSON_CTRL = "deckgl-widget-json-editor";
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

const ACE_OPTIONS = {
  maxLines: 20
};

export default function(options) {
  const viz = this;
  const container = document.createElement("div");
  container.classList.add(CLASS_NAME_JSON_CTRL);
  const editor = _deckWidget.editor = new JSONEditor(container, Object.assign(DEFAULT_OPTIONS, options || { }));
  if (editor.aceEditor) editor.aceEditor.setOptions(ACE_OPTIONS);
  document.getElementById(DECKGL_OVERLAY).addEventListener("keydown", (e) => {
    if (e.keyCode === KEY_CODE_E) {
      // console.log(e.keyCode, container.style.display);
      container.style.display = container.style.display === "none" ? "block" : "none";
    }
  });
  if (viz) {
    viz.widgetElement.append(container);
    const layerProps = viz.layers.map(layer => layer.properties);
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
      viz.layers.map((layer, i) => Object.assign(layer.properties, obj.layers[i]));
      // console.log(viz.layers);
      viz.render();
    } catch (e) {
      // console.log("error", e);
    }
  };

}
