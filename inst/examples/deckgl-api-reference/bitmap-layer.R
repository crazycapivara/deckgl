image <- paste0(
  "https://raw.githubusercontent.com/",
  "uber-common/deck.gl-data/master/",
  "website/sf-districts.png"
)
bounds <- c(-122.5190, 37.7045, -122.355, 37.829)

deck <- deckgl() %>%
  add_bitmap_layer(image = image, bounds = bounds) %>%
  add_basemap()

if (interactive()) deck
