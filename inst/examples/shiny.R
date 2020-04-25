## @knitr shiny-integration
library(shiny)
library(deckgl)

data("sf_bike_parking")

.app = reactiveValues(visible = TRUE)

props <- list(
  getPosition = ~lng + lat,
  extruded = TRUE,
  getTooltip = "Count: {{points.length}}"
)

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
      add_source("sf-bike-parking", sf_bike_parking) %>%
      add_hexagon_layer(
        source = "sf-bike-parking",
        properties = props
      ) %>%
      add_basemap()
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
      add_hexagon_layer(
        source = "sf-bike-parking",
        properties = props,
        visible = .app$visible
      ) %>%
      update_deckgl(it = "works")
  })

  df <- eventReactive(input$deck_onclick, {
    df <- input$deck_onclick$object$points %>%
      sapply("[", c("address", "racks", "spaces")) %>%
      t() %>%
      as.data.frame()
    df[, c("racks", "spaces")] %<>% sapply(as.integer)
    df
  })

  output$selected <- renderTable({
    df()
  })
}

if (interactive()) shinyApp(view, backend)
