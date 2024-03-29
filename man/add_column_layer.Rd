% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/layers_column-layer.R
\name{add_column_layer}
\alias{add_column_layer}
\title{Add a column layer to the deckgl widget}
\usage{
add_column_layer(
  deckgl,
  data = NULL,
  properties = list(),
  ...,
  id = "column-layer"
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
The \code{ColumnLayer} can be used to render a heatmap of vertical cylinders.
It renders a tesselated regular polygon centered at each given position (a "disk"), and extrude it in 3d.
}
\examples{
hexagon_centroids <- system.file("sample-data/centroids.csv", package = "deckgl") \%>\%
  read.csv()

deck <- deckgl(zoom = 11, pitch = 35) \%>\%
  add_column_layer(
    data = hexagon_centroids,
    diskResolution = 12,
    getPosition = ~lng + lat,
    getElevation = ~value,
    getFillColor = "@=[48, 128, value * 255, 255]",
    elevationScale = 5000,
    radius = 250,
    extruded = TRUE,
    tooltip = "Value: {{value}}"
  ) \%>\%
  add_control("Column Layer", "bottom-left") \%>\%
  add_basemap()

if (interactive()) deck
}
\seealso{
\url{https://deck.gl/#/documentation/deckgl-api-reference/layers/column-layer}
}
