export function makeTooltipElement(widgetElement) {
  const tooltipElement = document.createElement("div");
  tooltipElement.id = widgetElement.id + "-tooltip";
  tooltipElement.className = "tooltip";
  widgetElement.appendChild(tooltipElement);
}

export function setTooltipProp(deckGL, props) {
  if(!props.getTooltip) return;

  const tooltipId = deckGL.props.container + '-tooltip';
  const tooltipElement = document.getElementById(tooltipId);
  props.onHover = ({ object, x, y }) => {
    if (object) {
      tooltipElement.innerHTML = props.getTooltip(object);
    } else {
      tooltipElement.innerHTML = "";
    }
  };
}
