### Add legends via palettes

use_pal_numeric <- function(pal, domain) {
  props <- attributes(pal)
  if (props$colorType != "numeric") message("requires 'numeric' color type")

  values <- unique(domain) %>%
    sort()
  list( colors = pal(values), labels = values )
}

#domain <- sample(1:4, 10, replace = TRUE)
#pal_num <- scales::col_numeric("Blues", domain)
#use_pal_numeric(pal_num, domain)

###

use_pal_bin <- function(pal, domain) {
  props <- attributes(pal)
  if (props$colorType != "bin") stop("requires 'bin' color type")

  args <- props$colorArgs
  list(
    colors = pal(args$bins) %>%
      unique(),
    labels = create_labels(args$bin)
  )
}

create_labels <- function(x) {
  sapply(1:(length(x) - 1), function(i) paste(x[i], "-", x[i + 1]))
}

#pal_bin <- scales::col_bin("Blues", domain, 4)
#use_pal_bin(pal_bin, domain)

use_pal_factor <- use_pal_numeric

#domain <- sample(c("male", "female"), 10, replace = TRUE)
#pal_fac <- scales::col_factor("Blues", domain)
#use_pal_factor(pal_fac, domain)

use_legend_pal <- function(pal, domain, ...) {
  type <- attributes(pal)$colorType
  y <- switch(
    type,
    "numeric" =, factor = use_pal_numeric(pal, domain),
    "bin" = use_pal_bin(pal, domain)
  )
  y
}

### TEST ###
library(deckgl)

data("bart_stations")

bins <- 5
bs <- bart_stations
pal <- scales::col_bin("Blues", bs$exits, bins)
bs$color = pal(bs$exits)
# l <- use_legend_pal(pal, bs$exits)

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
