data("sf_bike_parking")

properties <- list(
  filter = "spaces > 4",
  visible = TRUE,
  extruded = TRUE,
  cellSize = 200,
  elevationScale = 4,
  getPosition = "@=[lng, lat]", #~lng + lat,
  colorRange = RColorBrewer::brewer.pal(6, "YlOrRd"),
  tooltip = "{{position.0}}, {{position.1}}<br/>Count: {{count}}"
)

deck <- deckgl(zoom = 11, pitch = 45, bearing = 35, element_id = "grid-layer") %>%
  add_source("sf-bike-parking", sf_bike_parking) %>%
  add_grid_layer(
    source = "sf-bike-parking",
    properties = properties
  ) %>%
  add_control("Grid Layer") %>%
  add_basemap() %>%
  add_json_editor(wrap = 50, maxLines = 23)

if (interactive()) deck
