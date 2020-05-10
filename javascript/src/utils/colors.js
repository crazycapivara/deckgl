import { color as d3Color } from "d3-color";

export default function (specifier) {
  // return Object.entries(d3Color(specifier)).map(item => item[1]).slice(0, 3);
  const rgba = d3Color(specifier);
  return [ rgba.r, rgba.g, rgba.b, rgba.opacity * 255 ];
}
