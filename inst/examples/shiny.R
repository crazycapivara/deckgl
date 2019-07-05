## @knitr shiny-integration
library(magrittr)
library(shiny)
library(deckgl)

.app = reactiveValues(visible = TRUE)

view <- fluidPage(
  h1("deckgl for R"),
  actionButton("visible", "visible"),
  deckglOutput("deck"),
  tableOutput("selected"),
  style = "font-family: Helvetica, Arial, sans-serif;"
)

backend <- function(input, output) {
  output$deck <- renderDeckgl({
    deckgl(pitch = 45) %>%
      # 'data = NULL' loads some sample data
      add_hexagon_layer(
        getTooltip = JS("object => `count: ${object.points.length}`")
      ) %>%
      add_mapbox_basemap()
  })

  observeEvent(input$deck_onclick, {
    info <- input$deck_onclick
    object <- info$object
    # print(info)
    print(object$points %>% length())
    print(names(object))
  })

  observeEvent(input$visible, {
    print("clicked")
    .app$visible = ifelse(.app$visible == TRUE, FALSE, TRUE)
    print(.app$visible)
    deckgl_proxy("deck") %>%
      add_hexagon_layer(visible = .app$visible) %>%
      update_deckgl(it = "works")
  })

  df <- eventReactive(input$deck_onclick, {
    df <- input$deck_onclick$object$points %>%
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

if (interactive()) shinyApp(view, backend)
