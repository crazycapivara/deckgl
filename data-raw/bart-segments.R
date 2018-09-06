source("data-raw/_tidy_up.R")

filename <- "https://raw.githubusercontent.com/uber-common/deck.gl-data/master/website/bart-segments.json"

bart_segments_ <- read_json(filename, simplifyVector = TRUE)

bart_segments <- bart_segments_[c("inbound", "outbound")] %>%
  as.tibble()
bart_segments[c("from_name", "from_lng", "from_lat")] <- bart_segments_$from %>%
  unnest_coords()
bart_segments[c("to_name", "to_lng", "to_lat")] <- bart_segments_$to %>%
  unnest_coords()

write_json(bart_segments, "inst/sample-data/bart-segments.json")

# --------------- test dataset
deckgl() %>%
  add_arc_layer(
    data = bart_segments,
    getStrokeWidth = 12,
    getSourcePosition = get_position("from_lat", "from_lng"),
    getTargetPosition = get_position("to_lat", "to_lng"),
    getSourceColor = JS("d => [Math.sqrt(d.inbound), 140, 0]"),
    getTargetColor = JS("d => [Math.sqrt(d.outbound), 140, 0]"),
    pickable = TRUE,
    getTooltip = JS("object => `${object.from_name} to ${object.to_name}`")
  ) %>%
  add_mapbox_basemap()
