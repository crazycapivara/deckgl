import hexColorToRGBArray from "./hex-color-to-rgb-array";

export default function(propertyName, keys) {
  console.log(propertyName, "make data accessor");
  if (typeof keys === "string") {
    const key = keys;
    // return data => data[key];
    return data => (propertyName.includes("Color") && typeof data[key] === "string") ?
      hexColorToRGBArray(data[key]) : data[key];
  }

  return data => keys.map(key => data[key]);
}
