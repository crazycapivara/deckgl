## @knitr shiny-integration
library(magrittr)
library(shiny)
library(deckgl)

sample_data <- sf_bike_parking
properties <- list(
  extruded = TRUE,
  radius = 200,
  elevationScale = 4,
  getPosition = ~lng + lat,
  getTooltip = JS("object => `${object.position.join(', ')}<br/>Count: ${object.points.length}`"),
  fixedTooltip = TRUE
)

view <- fluidPage(
  h1("deckgl for R"),
  actionButton("go", "go"),
  deckglOutput("deck"),
  style = "font-family: Helvetica, Arial, sans-serif;"
)

backend <- function(input, output) {
  output$deck <- renderDeckgl({
    deckgl(pitch = 45) %>%
      add_hexagon_layer(
        data = sample_data,
        properties = properties
      ) %>% add_mapbox_basemap()
  })

  observeEvent(input$deck_onclick, {
    info <- input$deck_onclick
    print(names(info$object))
  })

  observeEvent(input$go, {
    deckgl_proxy("deck") %>%
      add_hexagon_layer(
        data = sample_data, # [1:sample(1:190, 1), ],
        properties = properties,
        elevationScale = sample(1:10, 1)
      ) %>%
      update_deckgl(it = "works")
  })
}

if (interactive()) shinyApp(view, backend)
