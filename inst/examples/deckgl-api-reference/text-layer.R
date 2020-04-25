## @knitr text-layer
data("bart_stations")

deck <- deckgl(zoom = 10, pitch = 35) %>%
  add_text_layer(
    data = bart_stations,
    pickable = TRUE,
    getPosition = ~lng + lat,
    getText = ~name,
    getSize = 15,
    getAngle = 0,
    getTextAnchor = "middle",
    getAlignmentBaseline = "center",
    tooltip = "{{name}}<br/>{{address}}"
  ) %>%
  add_basemap(use_carto_style("voyager"))

if (interactive()) deck
