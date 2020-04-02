export default function(className, props, widgetElement) {
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

  if (props.getTooltip) {
    props.onHover = function({ x, y, object }) {
      const tooltipElement = document.getElementsByClassName("deck-tooltip")[0];
      if (!object) {
        // tooltipElement.innerHTML = "";
        tooltipElement.style.display = "none";
        return;
      }

      const text = props.getTooltip(object);
      if (!props.fixedTooltip) {
        tooltipElement.style.top = y + "px";
        tooltipElement.style.left = x + "px";
      }

      tooltipElement.innerHTML = text;
      tooltipElement.style.display = "block";
    };
  }

  return new deck[className](props);
}
