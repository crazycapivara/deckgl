export default function(widgetElement, width, height) {
  const widget = { };

  let deckGL = null;

  widget.renderValue = function(widgetData) {
    console.log(widgetData);
    widgetElement.innerHTML = "deckgl-widget";
  };

  widget.resize = function(width, height) {
    // not implemented yet
  };

  return widget;
}
