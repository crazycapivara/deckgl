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

  observeEvent(input$deckgl_onclick, {
    object <- input$deckgl_onclick$object
    print(input$deckgl_onclick$lnglat)
    print(object$points %>% length())
    print(object$centroid)
    df <- data.frame(
      count = length(object$points),
      lng = object$centroid[[1]][1],
      lat = object$centroid[[2]][1]
    )
    print(df)
  })
}

shinyApp(view, backend)
