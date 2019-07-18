export default function(props) {
  const tileServer = props.tileServer || "http://a.tile.stamen.com/toner/";
  const { x, y, z, bbox } = props.tile;
  const { west, south, east, north } = bbox;
  return new deck.BitmapLayer(props, {
    image: `${tileServer}/${z}/${x}/${y}.png`,
    bounds: [ west, south, east, north ]
  });
}
