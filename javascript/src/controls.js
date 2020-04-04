const CTRL_CLASS_NAME = "deckgl-widget-ctrl";
const CTRL_POSITIONS = [
  "top-left",
  "top-right",
  "bottom-right",
  "bottom-left"
];

export default function(widgetElement) {
  CTRL_POSITIONS.forEach(pos => {
    const ctrl = document.createElement("div");
    ctrl.classList.add(CTRL_CLASS_NAME, `${CTRL_CLASS_NAME}-${pos}`);
    widgetElement.appendChild(ctrl);
  });
}
