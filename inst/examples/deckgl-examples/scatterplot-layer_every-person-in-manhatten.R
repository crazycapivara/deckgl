## @knitr every-person-in-manhatten
library(deckgl)
library(jsonlite)
library(tibble)

data_url <- paste0(
  "https://raw.githubusercontent.com/",
  "uber-common/deck.gl-data/",
  "master/examples/scatterplot/manhattan.json"
)

data <- data_url %>%
  read_json(simplifyVector = TRUE) %>%
  as_tibble(.name_repair = ~ c("lng", "lat", "sex"))

male_color <- rgb(0, 128, 255, maxColorValue = 255)
female_color <- rgb(255, 0, 128, maxColorValue = 255)
data$color <- ifelse(data$sex == 1, male_color, female_color)

initial_view_state <- list(
  longitude = -73.985130,
  latitude = 40.758896,
  zoom = 11,
  maxZoom = 16,
  pitch = 0,
  bearing = 0
)

deck <- deckgl(initialViewState = initial_view_state) %>%
  add_scatterplot_layer(
    data = data,
    radius_scale = 30,
    radius_min_pixels = 0.25,
    get_position = ~lng + lat,
    get_fill_color = ~color,
    get_radius = 1,
    pickable = TRUE,
    get_tooltip = "{{lng}}, {{lat}}"
  ) %>%
  add_legend(
    colors = c(female_color, male_color),
    labels = c("female", "male"),
    title = "Legend"
  ) %>%
  add_basemap()

if (interactive()) deck
