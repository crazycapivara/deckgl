import { color as d3Color } from "d3-color";
import { COLOR_PROPS } from "./constants";

export function convertColors(props) {
  const _convertColor = (specifier) => typeof specifier === "string"
    ? convertColor(specifier)
    : specifier;
  const convertedProps = { };
  for (const key in props) {
    const value = props[key];
    if (key === "colorRange") {
      convertedProps[key] = value.map(specifier => _convertColor(specifier));
    }

    if (COLOR_PROPS.includes(key)) {
      convertedProps[key] = (data) => {
        /*
        const specifier = typeof value === "function" ? value(data) : value;
        return _convertColor(specifier);
        */
        return _convertColor(typeof value === "function" ? value(data) : value);
      };
    }
  }

  return convertedProps;
}

export function convertColor(specifier) {
  const rgba = d3Color(specifier);
  return [ rgba.r, rgba.g, rgba.b, rgba.opacity * 255 ];
}
