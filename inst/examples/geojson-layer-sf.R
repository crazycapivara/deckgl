require(sf)
require(geojsonio)

nc_sf <- system.file("shape/nc.shp", package = "sf") %>%
  st_read(quiet = TRUE)
nc_geojson <- geojsonio::geojson_json(nc_sf)

properties <- list(
  filled = TRUE,
  stroked = TRUE,
  # lineWidthScale = 20,
  lineWidthMinPixels = 2,
  getLineWidth = 1,
  getLineColor = c(165, 42, 42),
  getFillColor = JS("data => [data.properties.AREA * 1000, 140, 10]"),
  # getFillColor = JS("data => data.properties.AREA > 0.2 ? [240, 140, 10] : [210, 80, 20]"), #c(160, 160, 180, 200),
  getTooltip = JS("object => `${object.properties.NAME}<br/>Area: ${object.properties.AREA}`")
)

token <- ""

deckgl(latitude = 35.782169, longitude = -80.793457, zoom = 6) %>%
  add_geojson_layer(data = nc_geojson, properties = properties) # %>% add_mapbox_basemap(token)
