## @knitr shiny-integration
library(shiny)
library(deckgl)

sample_data <- sf_bike_parking
properties <- list(
  extruded = TRUE,
  radius = 200,
  elevationScale = 4,
  getPosition = ~lng + lat,
  tooltip = "{{position.0}}, {{position.1}}<br/>Count: {{points.length}}"
)

view <- fluidPage(
  h1("deckgl for R"),
  actionButton("go", "go"),
  deckglOutput("rdeck"),
  style = "font-family: Helvetica, Arial, sans-serif;"
)

backend <- function(input, output) {
  output$rdeck <- renderDeckgl({
    deckgl(pitch = 45) %>%
      add_hexagon_layer(
        data = sample_data,
        properties = properties
      ) %>%
      add_basemap()
  })

  observeEvent(input$deck_onclick, {
    info <- input$deck_onclick
    print(names(info$object))
  })

  observeEvent(input$go, {
    deckgl_proxy("rdeck") %>%
      add_hexagon_layer(
        data = sample_data[1:sample(1:190, 1), ],
        properties = properties,
        elevationScale = sample(1:10, 1)
      ) %>%
      update_deckgl(it = "works")
  })
}

if (interactive()) shinyApp(view, backend)
