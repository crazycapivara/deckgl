library("data.table")
library("magrittr")

sample_data <- "https://raw.githubusercontent.com/uber-common/deck.gl-data/master/examples/3d-heatmap/heatmap-data.csv"
df <- fread(sample_data)

color_to_rgb <- function(color) col2rgb(color) %>% as.vector()

color_range <- lapply(
  c("#0198BD", "#49E3CE", "#D8FEB5", "#FEEDB1", "#FEAD54", "#D1374E"),
  color_to_rgb
)

deckgl(
  longitude = -1.4157267858730052,
  latitude = 52.232395363869415,
  zoom = 6.6,
  pitch = 40.5,
  bearing = -27.396674584323023
) %>%
  add_grid_layer(
    data = df,
    getPosition = get_position("lat", "lng"),
    cellSize = 2000,
    elevationScale = 50,
    extruded = TRUE,
    opacity = 0.5,
    colorRange = color_range,
    getTooltip = JS("object => `${object.count} accidents`")
  ) %>%
  add_mapbox_basemap(style = "mapbox://styles/mapbox/dark-v9")
