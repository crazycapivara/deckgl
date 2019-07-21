## @knitr shiny-integration
library(magrittr)
library(shiny)
library(deckgl)

sample_data <- bart_segments
properties <- list(
  getWidth = 10,
  getSourcePosition = ~from_lng + from_lat,
  getTargetPosition = ~to_lng + to_lat
)

view <- fluidPage(
  h1("deckgl for R"),
  actionButton("go", "go"),
  deckglOutput("deck"),
  style = "font-family: Helvetica, Arial, sans-serif;"
)

backend <- function(input, output) {
  output$deck <- renderDeckgl({
    deckgl(zoom = 10, pitch = 35) %>%
      add_arc_layer(
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
      add_arc_layer(
        data = sample_data[1:sample(1:45, 1), ],
        properties = properties
      ) %>%
      update_deckgl(it = "works")
  })
}

if (interactive()) shinyApp(view, backend)
