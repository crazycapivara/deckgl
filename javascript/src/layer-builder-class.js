import makeDataAccessor from "./helpers/make-data-accessor";

// same as 'layer-builder' using class syntax
export default class {
  constructor(el, layer) {
    this.el = el;
    this.tooltipElement = _deckGLWidget._store[el.id].tooltipElement;
    this.layer = layer;
    this.properties = layer.properties;
  }

  _makeDataAccessors() {
    for (let key of Object.keys(this.properties)) {
      let property = this.properties[key];
      if (typeof property === "object" && property.dataAccessor !== undefined) {
        this.properties[key] = makeDataAccessor(key, property.dataAccessor);
      }
    }
  }

  _setShinyCallback() {
    if (HTMLWidgets.shinyMode) {
      this.properties.onClick = info => {
        let data = { lng: info.lngLat[0], lat: info.lngLat[1], object: info.object };
        Shiny.onInputChange(this.el.id + "_onclick", data);
      };
    }
  }

  _setTooltip() {
    if (this.properties.getTooltip) {
      const getTooltip = this.properties.getTooltip;
      const fixedTooltip = this.properties.fixedTooltip;
      const tooltipElement = this.tooltipElement;
      this.properties.onHover = ({ x, y, object }) => {
        if (!object) {
          tooltipElement.innerHTML = "";
          return;
        }

        let text = getTooltip(object);
        if (!fixedTooltip) {
          tooltipElement.style.top = y + "px";
          tooltipElement.style.left = x + "px";
        }

        tooltipElement.innerHTML = text;
      };
    }
  }

  _flipData() {
    if (this.properties.dataframeToD3) {
      this.layer.data = HTMLWidgets.dataframeToD3(this.layer.data);
    }
  }

  render() {
    this._makeDataAccessors();
    this._setShinyCallback();
    this._setTooltip();
    this._flipData();
    this.properties.data = this.layer.data;
    return new deck[this.layer.className](this.properties);
  }
}
