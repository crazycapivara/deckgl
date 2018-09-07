library(shiny)
library(deckgl)

view <- fluidPage(
  h1("deckgl for R"),
  deckglOutput("deckgl"),
  style = "font-family: ubuntu;"
)

backend <- function(input, output) {
  output$deckgl <- renderDeckgl({
    deckgl(pitch = 45) %>%
      # 'data = NULL' loads some sample data
      add_hexagon_layer(
        getTooltip = JS("object => `count: ${object.points.length}`")
      ) %>%
      add_mapbox_basemap()
  })
}

shinyApp(view, backend)
