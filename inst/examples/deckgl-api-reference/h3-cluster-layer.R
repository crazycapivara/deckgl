## @knitr h3-cluster-layer
data_url <- paste0(
  "https://raw.githubusercontent.com/uber-common/deck.gl-data/",
  "master/website/sf.h3clusters.json"
)
# sample_data <- jsonlite::fromJSON(data_url, simplifyDataFrame = FALSE)
sample_data <- data_url

properties <- list(
  stroked = TRUE,
  filled = TRUE,
  extruded = FALSE,
  getHexagons = ~hexIds,
  getFillColor = JS("d => [255, (1 - d.mean / 500) * 255, 0]"),
  getLineColor = c(255, 255, 255),
  lineWidthMinPixels = 2,
  getTooltip = ~mean
)

deck <- deckgl(zoom = 10.5, pitch = 20) %>%
  add_h3_cluster_layer(data = sample_data, properties = properties) %>%
  add_basemap()

if (interactive()) deck
