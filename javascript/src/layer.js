// import { parse, compile } from "expression-eval";
import { render as mustacheRender } from "mustache";
import {
  CLASS_NAME_TOOLTIP,
  /*FUNCTION_IDENTIFIER*/ } from "./constants";
import {
  convertColor,
  convertExpressions } from "./utils";

// Move to utils
const COLOR_PROPS = [ "getColor", "getStrokeColor", "getFillColor" ];
//const isFunction = (value) => typeof value === "string" && value.startsWith(FUNCTION_IDENTIFIER);
const toColor = (specifier) => typeof specifier === "string" ? convertColor(specifier) : specifier;

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
  if (tooltip) props.onHover = toTooltip(tooltip);

  props = Object.assign(props, convertExpressions(props));
  return Object.assign(props, convertColors(props));
}

/*
function convertJSON(props) {
  const convertedProps= { };
  for (const key in props) {
    const value = props[key];
    if (isFunction(value)) convertedProps[key] = convertExpression(value);
  }

  return convertedProps;
}
*/

function convertColors(props) {
  const convertedProps = { };
  for (const key in props) {
    const value = props[key];
    if (key === "colorRange") {
      convertedProps[key] = value.map(specifier => toColor(specifier));
    } else if (COLOR_PROPS.includes(key)) {
      convertedProps[key] = (data) => {
        const specifier = typeof value === "function" ? value(data) : value;
        return toColor(specifier);
      };
    }
  }

  return convertedProps;
}

function toTooltip(tooltip) {
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
    tooltipElement.innerHTML = typeof tooltip === "function" ?
      tooltip(object) : mustacheRender(typeof tooltip === "string" ? tooltip : tooltip.html, object);
    tooltipElement.style.display = "block";
  };
}

/*
function toFunction(value) {
  const expr = value.replace(FUNCTION_IDENTIFIER, "");
  const func = compile(expr);
  return (data) => func(Object.assign({ "Math": Math, "console": console }, data));
}
*/
