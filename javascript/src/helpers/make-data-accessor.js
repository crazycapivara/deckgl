export default function(keys) {
  if (typeof keys === "string") {
    const key = keys;
    return data => data[key];
  }

  return data => keys.map(key => data[key]);
}
