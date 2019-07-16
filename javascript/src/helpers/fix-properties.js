// Fix JS properties
export default function(layers) {
  for (let i = 0; i < layers.length; i++) {
    var properties = layers[i].properties;
    for (let key of Object.keys(properties)) {
      if (typeof properties[key] === "string") {
        try {
          properties[key] = eval(properties[key]);
        } catch(err) { }
      } // end if
    } // end for
  } // end for
}
