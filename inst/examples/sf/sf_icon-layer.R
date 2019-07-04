library(deckgl)
library(sf)
library(spData)

sample_data <- cycle_hire
sample_data$marker <- ifelse(sample_data$nempty > 0, "marker1", "marker2")

icon_mapping <- list(
  # default mapping
  marker1 = icon_definition(),
  # use second icon on the default atlas image
  marker2 = icon_definition(x = 128, mask = FALSE)
)

deckgl(longitude = -0.118092, latitude = 51.509865) %>%
  add_icon_layer(
    data = sample_data,
    getPosition = ~geometry,
    getIcon = ~marker,
    iconMapping = icon_mapping,
    getTooltip = ~nempty
  ) %>%
  add_mapbox_basemap()
