library(shiny)
library(dplyr)
library(deckgl)

### Setup
aggregate_df <- data.frame(
  area = LETTERS[1:2],
  count = 110:111,
  median_lon = c( 3.39, 3.41 ),
  median_lat = c( 49.7, 49.4 ),
  color = c("#0080FF", "#FF0080")
)

orig_df <- data.frame(
  area = rep( c( 'A', 'B' ), c( 3, 2 ) ),
  count = 10:14,
  lon = c( 3.45, 3.39, 3.19, 3.41, 3.92 ),
  lat = c( 48, 49.7, 52, 49.4, 51.5 ),
  color = c("#0080FF", "#FF0080", "#FF3030", "#00EE00", '#FF7F24')
)

props <- list(
  getElevation = ~count,
  getFillColor = ~color,
  tooltip = "Area: {{area}}, Count: {{count}}"
)


### View
view <- fluidPage(
  h1("Test"),
  deckglOutput("map", height = "600px")
)

### Backend
server <- function(input, output) {
  output$map <- renderDeckgl({
    deckgl( zoom = 7, pitch = 35, latitude = 48.29507, longitude = 4.0731520 ) %>%
      add_column_layer(
        data = aggregate_df,
        properties = props,
        getPosition = ~median_lon + median_lat,
        elevationScale = 100
      ) %>%
      add_basemap()

  })

  observeEvent(input$map_onclick, {
    info <- input$map_onclick
    a <- info$object$area
    message(a)
    deckgl_proxy("map") %>%
      add_column_layer(
        data = dplyr::filter(orig_df, area == a),
        properties = props,
        getPosition = ~lon + lat,
        elevationScale = 1000
      ) %>%
      set_view_state( zoom = 9, pitch = 35, latitude = info$lat, longitude = info$lng ) %>%
      update_deckgl()
  })
}

if (interactive()) shinyApp(view, server)
