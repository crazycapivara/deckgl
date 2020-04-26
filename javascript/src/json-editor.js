const DECKGL_OVERLAY = "deckgl-overlay";
const KEY_CODES = {
  "e": 69
};
const CLASS_NAME_JSON_CTRL = "deckgl-widget-json-editor";

const ACE_OPTIONS = {
  mode: "ace/mode/json",
  tabSize: 2,
  maxLines: 15
};

export default function({ options, style, theme }) {
  const viz = this;
  const container = document.createElement("div");
  container.classList.add(CLASS_NAME_JSON_CTRL);
  if (style) container.style.cssText = style;
  const editor = ace.edit(container, Object.assign(ACE_OPTIONS, options));
  editor.setTheme(`ace/theme/${theme || "idle_fingers"}`);
  document.getElementById(DECKGL_OVERLAY).addEventListener("keydown", (e) => {
    if (e.keyCode === KEY_CODES.e) {
      container.style.display = container.style.display === "none" ? "block" : "none";
    }
  });
  if (viz) {
    viz.widgetElement.append(container);
    const layerProps = viz.layers.map(layer => layer.properties);
    const JSONString = JSON.stringify({ layers: layerProps }, null, "\t");
    editor.session.setValue(JSONString);

    viz.editor = editor;
    editor.session.on('change', render(viz));
  }

  return editor;
}

function render(viz) {
  return (delta) => {
    try {
      // console.log(delta);
      const obj = JSON.parse(viz.editor.getValue());
      //console.log(obj);
      viz.layers.map((layer, i) => Object.assign(layer.properties, obj.layers[i]));
      viz.render();
    } catch (e) {
      // console.log("error", e);
    }
  };
}
