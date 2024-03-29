% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/layers_point-cloud-layer.R
\name{add_point_cloud_layer}
\alias{add_point_cloud_layer}
\title{Add a point cloud layer to the deckgl widget}
\usage{
add_point_cloud_layer(
  deckgl,
  data = NULL,
  properties = list(),
  ...,
  id = "point-cloud-layer"
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
The \code{PointCloudLayer} takes in points with 3d positions, normals and colors and renders them as spheres with a certain radius.
}
\examples{
## @knitr point-cloud-layer
sample_data <- paste0(
  "https://raw.githubusercontent.com/",
  "uber-common/deck.gl-data/",
  "master/website/pointcloud.json"
)

properties <- list(
  pickable = TRUE,
  coordinateSystem = JS("deck.COORDINATE_SYSTEM.METER_OFFSETS"),
  coordinateOrigin = c(-122.4, 37.74),
  pointSize = 4,
  getPosition = ~position,
  getNormal = ~normal,
  getColor = ~color,
  lightSettings = list(),
  tooltip = "{{position.0}}, {{position.1}}"
)

deck <- deckgl(pitch = 45, zoom = 10.5) \%>\%
  add_point_cloud_layer(data = sample_data, properties = properties) \%>\%
  add_basemap() \%>\%
  add_control("Point Cloud Layer")

if (interactive()) deck
}
\seealso{
\url{https://deck.gl/#/documentation/deckgl-api-reference/layers/point-cloud-layer}
}
