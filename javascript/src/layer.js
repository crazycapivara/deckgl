import { CLASS_NAME_TOOLTIP } from "./constants";
import { render as mustacheRender } from "mustache";

export default function(className, props, widgetElement) {
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

  // Support deprecated 'getTooltip' property
  const tooltip = props.tooltip || props.getTooltip;
  if (tooltip) {
    const tooltipElement = createTooltip(widgetElement);
    if (tooltip.style) tooltipElement.style.cssText = tooltip.style;
    props.onHover = function({ x, y, object }) {
      // const tooltipElement = document.getElementsByClassName("deckgl-widget-tooltip")[0];
      // if (tooltip.style) tooltipElement.style.cssText = tooltip.style;
      if (!object) {
        // tooltipElement.innerHTML = "";
        tooltipElement.style.display = "none";
        return;
      }

      // const text = props.getTooltip(object);
      if (!tooltip.fixed) {
        tooltipElement.style.top = y + "px";
        tooltipElement.style.left = x + "px";
      }

      // tooltipElement.innerHTML = text;
      tooltipElement.innerHTML = mustacheRender(tooltip.html, object);
      tooltipElement.style.display = "block";
    };
  }

  Object.assign(props, convertColorProps(props));

  return new deck[className](props);
}

function convertColorProps(props) {
  const convertedProps = { };
  for (let [key, value] of Object.entries(props)) {
    if (key.includes("Color")) {
      convertedProps[key] = (data) => {
        const specifier = typeof value === "function" ? value(data) : value;
        const rgba = typeof specifier === "string" ? _deckWidget.convertColor(specifier) : specifier;
        return rgba;
      };
    }
  }

  return convertedProps;
}

function createTooltip(widgetElement) {
  const tooltip = document.createElement("div");
  tooltip.classList.add(CLASS_NAME_TOOLTIP);
  widgetElement.appendChild(tooltip);
  return tooltip;
}
