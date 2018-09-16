library(geojsonio)

val_max <- apply(us_cities[, c("lat", "long")], 2, max)
val_min <- apply(us_cities[, c("lat", "long")], 2, min)
center <- ((val_max + val_min) / 2) %>%
  as.list()

us_cities$marker <- ifelse(us_cities$capital > 0, "marker2", "marker1")

icon_mapping <- list(
  marker1 = icon_definition(), # default mapping
  marker2 = icon_definition(x = 128, mask = FALSE) # use second icon on the default atlas image
)

deckgl(longitude = center$long, latitude = center$lat, zoom = 3) %>%
  add_icon_layer(
    data = us_cities,
    iconMapping = icon_mapping,
    getIcon = JS("d => d.marker"),
    getPosition = get_position("lat", "long"),
    pickable = TRUE,
    onClick = JS("info => deckglWidget.tooltipElement.innerHTML = info.object.name"),
    getSize = 3.5,
    sizeScale = 15
  ) %>%
  add_mapbox_basemap()
