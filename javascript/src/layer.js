import { render as mustacheRender } from "mustache";
import {
  convertExpressions,
  convertColors } from "./utils";
import { CLASS_NAME_TOOLTIP } from "./constants";

export default function(props, widgetElement) {
  // Pass data back to R in 'shinyMode'
  if (HTMLWidgets.shinyMode) {
    props.onClick = function(info) {
      const data = {
        lng: info.lngLat[0],
        lat: info.lngLat[1],
        object: info.object
      };
      Shiny.onInputChange(widgetElement.id + "_onclick", data);
    };
  }

  // TODO: Support deprecated? 'getTooltip' property
  const tooltip = props.tooltip || props.getTooltip;
  if (tooltip) {
    props.onHover = convertTooltip(tooltip);
  }

  props = Object.assign(props, convertExpressions(props));
  props = Object.assign(props, convertColors(props));
  return props;
}

// TODO: Maybe also move to 'utils'
function convertTooltip(tooltip) {
  const tooltipElement = document.getElementsByClassName(CLASS_NAME_TOOLTIP)[0];
  if (tooltip.style) tooltipElement.style.cssText = tooltip.style;
  return function({ x, y, object }) {
    if (!object) {
      tooltipElement.innerHTML = "";
      tooltipElement.style.display = "none";
      return;
    }

    tooltipElement.style.top = y + "px";
    tooltipElement.style.left = x + "px";
    tooltipElement.innerHTML = typeof tooltip === "function"
      ? tooltip(object)
      : mustacheRender(typeof tooltip === "string" ? tooltip : tooltip.html, object);
    tooltipElement.style.display = "block";
  };
}
