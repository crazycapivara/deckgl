export default function(hexColor) {
  hexColor = hexColor.substring(1); // remove '#'
  return [
    parseInt(hexColor.substring(0, 2), 16),
    parseInt(hexColor.substring(2, 4), 16),
    parseInt(hexColor.substring(4), 16)
  ];
}
