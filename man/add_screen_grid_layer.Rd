% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/layers_screen-grid-layer.R
\name{add_screen_grid_layer}
\alias{add_screen_grid_layer}
\title{Add a screen grid layer to the deckgl widget}
\usage{
add_screen_grid_layer(
  deckgl,
  data = NULL,
  properties = list(),
  ...,
  id = "screen-grid-layer"
)
}
\arguments{
\item{deckgl}{A deckgl widget object.}

\item{data}{The url to fetch data from or a data object.}

\item{properties}{A named list of properties with names corresponding to the properties defined
in the \href{https://deck.gl/#/documentation/deckgl-api-reference}{deckgl-api-reference}
for the given layer class. The \code{properties} parameter can also be an empty list. In this case
all props must be passed as named arguments.}

\item{...}{Named arguments that will be added to the \code{properties} object. Identical parameters
are overwritten.}

\item{id}{The unique id of the layer.}
}
\description{
The \code{ScreenGridLayer} takes in an array of latitude and longitude coordinated points,
aggregates them into histogram bins and renders as a grid.
}
\examples{
## @knitr screen-grid-layer
data("sf_bike_parking")

properties <- list(
  opacity = 0.8,
  cellSizePixels = 50,
  colorRange = RColorBrewer::brewer.pal(6, "Blues"),
  getPosition = ~lng + lat,
  getWeight = ~spaces
)

deck <- deckgl() \%>\%
  add_screen_grid_layer(data = sf_bike_parking, properties = properties) \%>\%
  add_basemap() \%>\%
  add_control("Screen Grid Layer")

if (interactive()) deck
}
\seealso{
\url{https://deck.gl/#/documentation/deckgl-api-reference/layers/screen-grid-layer}
}
