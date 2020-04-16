import {
  CLASS_NAME_TOOLTIP,
  CLASS_NAME_CTRL,
  CLASS_NAME_CTRL_GROUP,
  POSITIONS } from "./constants";

export function createControlGroups(widgetElement) {
  POSITIONS.forEach(pos => {
    const ctrl = document.createElement("div");
    ctrl.classList.add(CLASS_NAME_CTRL_GROUP, `${CLASS_NAME_CTRL}-${pos}`);
    widgetElement.appendChild(ctrl);
  });
}

export function addControl({ html, pos, style }) {
  const ctrl = document.createElement("div");
  ctrl.classList.add(CLASS_NAME_CTRL);
  if (style) ctrl.style.cssText = style;

  ctrl.innerHTML = html;
  const parent = document.getElementsByClassName(`${CLASS_NAME_CTRL}-${pos  || "top-right"}`)[0];
  parent.appendChild(ctrl);
  return ctrl;
}

export function addLegend({ items, title, pos, style }) {
  const rows = items.map(item => `
    <li>
      <span class="point-mark" style="background-color:${item.color};border: 1px solid black;"></span>
      <span>${item.label}</span>
    </li>
  `);
  const html = `
    <div class="legend">
      <div class="legend-title">${title || "" }</div>
      <div class="legend-items"><ul>${rows.join("\n")}</ul></div>
    </div>
  `;
  const legend = addControl({ html, pos, style });
  return legend;
}

export function createTooltip(widgetElement) {
  const tooltip = document.createElement("div");
  tooltip.classList.add(CLASS_NAME_TOOLTIP);
  widgetElement.appendChild(tooltip);
  return tooltip;
}
