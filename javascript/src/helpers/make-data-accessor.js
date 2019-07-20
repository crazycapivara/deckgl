import hexColorToRGBArray from "./hex-color-to-rgb-array";

export default function(propertyName, keys) {
  console.log(propertyName, "make data accessor");
  if (typeof keys === "string") {
    const key = keys;
    const isColor = propertyName.includes("Color");
    if (isColor) {
      // console.log("is color");
      return data => typeof data[key] === "string" ? hexColorToRGBArray(data[key]) : data[key];
    }

    return data => data[key];
  }

  return data => keys.map(key => data[key]);
}
