## @knitr h3-cluster-layer
data_url <- paste0(
  "https://raw.githubusercontent.com/uber-common/deck.gl-data/",
  "master/website/sf.h3clusters.json"
)
sample_data <- jsonlite::fromJSON(data_url, simplifyDataFrame = FALSE)

properties <- list(
  stroked = TRUE,
  filled = TRUE,
  extruded = FALSE,
  getHexagons = get_property("hexIds"), # d => d.hexIds,
  getFillColor = JS("d => [255, (1 - d.mean / 500) * 255, 0]"),
  getLineColor= c(255, 255, 255),
  lineWidthMinPixels = 2,
  getTooltip = get_property("mean")
)

deck <- deckgl(zoom = 10.5, pitch = 20) %>%
  add_h3_cluster_layer(data = sample_data, properties = properties) %>%
  add_mapbox_basemap()

if (interactive()) deck
