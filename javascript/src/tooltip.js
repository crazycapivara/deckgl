export function makeTooltipElement(widgetElement) {
  const tooltipElement = document.createElement("div");
  tooltipElement.id = widgetElement.id + "-tooltip";
  tooltipElement.className = "tooltip";
  widgetElement.appendChild(tooltipElement);
}

export function setTooltipProp(deckGL, props) {
  if(!props.getTooltip) return;

  console.log(props.getTooltip);
  const tooltipId = deckGL.props.container + '-tooltip';
  const tooltipElement = document.getElementById(tooltipId);
  tooltipElement.innerHTML = props.getTooltip;
  props.onHover = ({ object, x, y }) => {
    if (object) {
      console.log(object.points.length);
    } else {
      console.log("nothing to do");
    }
  };
}
