library(shiny)
library(deckgl)

view <- fluidPage(
  h1("deckgl for R"),
  deckglOutput("deckgl"),
  tableOutput("selected"),
  style = "font-family: Helvetica, Arial, sans-serif;"
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
    info <- input$deckgl_onclick
    object <- info$object
    # print(info)
    print(object$points %>% length())
    print(object$centroid)
  })

  df <- eventReactive(input$deckgl_onclick, {
    df <- input$deckgl_onclick$object$points %>%
      sapply("[", c("ADDRESS", "RACKS", "SPACES")) %>%
      t() %>%
      as.data.frame()
    df[, c("RACKS", "SPACES")] %<>% sapply(as.integer)
    df
  })

  output$selected <- renderTable({
    df()
  })
}

shinyApp(view, backend)
