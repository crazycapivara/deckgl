## @knitr road-safety-in-uk
library("deckgl")
library("data.table")

data_url <- paste0(
  "https://raw.githubusercontent.com/",
  "uber-common/deck.gl-data/",
  "master/examples/3d-heatmap/heatmap-data.csv"
)
sample_data <- fread(data_url) %>%
  na.omit()

color_to_rgb <- function(color) col2rgb(color) %>% as.vector()
# color_range <- c("#0198BD", "#49E3CE", "#D8FEB5", "#FEEDB1", "#FEAD54", "#D1374E") %>%
color_range <- scales::brewer_pal(palette = "YlOrRd")(6) %>%
  lapply(color_to_rgb)

light_settings <- list(
  lightsPosition = c(-0.144528, 49.739968, 8000, -3.807751, 54.104682, 8000),
  ambientRatio = 0.4,
  diffuseRatio = 0.6,
  specularRatio = 0.2,
  lightsStrength = c(0.8, 0.0, 0.8, 0.0),
  numberOfLights = 2
)

initial_view_state <- list(
  longitude = -1.4157267858730052,
  latitude = 52.232395363869415,
  zoom = 6.6,
  pitch = 40.5,
  bearing = -27.396674584323023
)

deck <- deckgl(
  initialViewState = initial_view_state
  # , style = list(background = "black")
) %>%
  add_data(sample_data) %>%
  add_hexagon_layer(
    data = get_data(),
    colorRange = color_range,
    coverage = 1,
    elevationRange = c(0, 3000),
    elevationScale = 50,
    extruded = TRUE,
    getPosition = ~lng + lat,
    lightSettings = light_settings,
    getTooltip = JS("object => `${object.points.length} accidents`"),
    opacity = 1,
    radius = 1000,
    upperPercentile = 100
  ) %>%
  add_mapbox_basemap(style = "mapbox://styles/mapbox/dark-v9")

if (interactive()) deck
