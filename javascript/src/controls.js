const CLASS_NAME_CTRL = "deckgl-widget-ctrl";
const CLASS_NAME_CTRL_GROUP = `${CLASS_NAME_CTRL}-group`;
const POSITIONS = [
  "top-left",
  "top-right",
  "bottom-right",
  "bottom-left"
];

export function createControls(widgetElement) {
  POSITIONS.forEach(pos => {
    const ctrl = document.createElement("div");
    ctrl.classList.add(CLASS_NAME_CTRL_GROUP, `${CLASS_NAME_CTRL}-${pos}`);
    widgetElement.appendChild(ctrl);
  });
}

export function addControl(html, pos, style) {
  const ctrl = document.createElement("div");
  ctrl.classList.add(CLASS_NAME_CTRL);
  if (style) ctrl.style.cssText = style;

  ctrl.innerHTML = html;
  const parent = document.getElementsByClassName(`${CLASS_NAME_CTRL}-${pos}`)[0];
  parent.appendChild(ctrl);
  return ctrl;
}
