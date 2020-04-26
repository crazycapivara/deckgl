const DECKGL_OVERLAY = "deckgl-overlay";
const KEY_CODE_E = 69;
const CLASS_NAME_JSON_CTRL = "deckgl-widget-json-editor";
// TODO: Remove when use 'Ace' only
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
  mode: "ace/mode/json",
  tabSize: 2,
  maxLines: 15
};

export default function({ options, style }) {
  const viz = this;
  const container = document.createElement("div");
  container.classList.add(CLASS_NAME_JSON_CTRL);
  //if (style) container.style.cssText = style;
  //container.style.cssText = "height: 200px;";
  const editor = ace.edit(container, ACE_OPTIONS);
  // editor.session.setTabSize(2);
  editor.setTheme("ace/theme/idle_fingers");
  viz.widgetElement.append(container);
  // const editor = _deckWidget.editor = new JSONEditor(container, Object.assign(DEFAULT_OPTIONS, options || { }));
  /*
  if (editor.aceEditor) editor.aceEditor.setOptions(ACE_OPTIONS);
  document.getElementById(DECKGL_OVERLAY).addEventListener("keydown", (e) => {
    if (e.keyCode === KEY_CODE_E) {
      // console.log(e.keyCode, container.style.display);
      container.style.display = container.style.display === "none" ? "block" : "none";
    }
  });
  */

  if (viz) {
    viz.widgetElement.append(container);
    const layerProps = viz.layers.map(layer => layer.properties);
    // editor.set({ layers: layerProps });
    // editor.options.onChangeText = render(viz);
    const json = JSON.stringify({ layers: layerProps }, null, "\t");
    editor.session.setValue(json);

    viz.editor = editor;
    editor.session.on('change', render(viz));
  }

  return editor;
}

function render(viz) {
  return (text) => {
    try {
      // console.log(text);
      const obj = JSON.parse(viz.editor.getValue()); //JSON.parse(text);
      console.log("obj", obj);
      viz.layers.map((layer, i) => Object.assign(layer.properties, obj.layers[i]));
      // console.log(viz.layers);
      viz.render();
    } catch (e) {
      console.log("error", e);
    }
  };

}
