library(deckgl)

data("bart_stations")

bins <- 5
bs <- bart_stations
pal <- scales::col_bin("Blues", bs$exits, bins)
bs$color = pal(bs$exits)

deckgl(zoom = 9.5) %>%
  add_scatterplot_layer(
    data = bs,
    getPosition = ~lng + lat,
    getFillColor = ~color,
    getRadius = 500,
    tooltip = "Exits: {{exits}}"
  ) %>%
  add_legend_pal(
    pal,
    title = "Exits",
    style = "background: rgba(0,0,0, 0.7); color: white"
  ) %>%
  add_basemap()
