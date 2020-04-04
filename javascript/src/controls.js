const CTRL_CLASS_NAME = "deckgl-widget-ctrl";
const CTRL_POSITIONS = [
  "top-left",
  "top-right",
  "bottom-right",
  "bottom-left"
];

export function createControls(widgetElement) {
  CTRL_POSITIONS.forEach(pos => {
    const ctrl = document.createElement("div");
    ctrl.classList.add(CTRL_CLASS_NAME, `${CTRL_CLASS_NAME}-${pos}`);
    widgetElement.appendChild(ctrl);
  });
}

export function addControl(content, pos, style) {
  const ctrl = document.createElement("div");
  ctrl.style.cssText = style || "padding: 10px; background: white;";
  ctrl.innerHTML = content;
  const parent = document.getElementsByClassName(`${CTRL_CLASS_NAME}-${pos}`)[0];
  parent.appendChild(ctrl);
  return ctrl;
}
