% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/layers_icon-layer.R
\name{use_default_icon_properties}
\alias{use_default_icon_properties}
\title{Use default icon properties}
\usage{
use_default_icon_properties(
  sizeScale = 15,
  getSize = 5,
  getColor = c(240, 140, 0)
)
}
\arguments{
\item{sizeScale}{icon size multiplier}

\item{getSize}{height of each object (in pixels),
if a number is provided, it is used as the size for all objects,
if a function is provided, it is called on each object to retrieve its size}

\item{getColor}{rgba color of each object,
if an array is provided, it is used as the color for all objects
if a function is provided, it is called on each object to retrieve its color}
}
\description{
Returns icon properties with default values for \code{iconAtlas}, \code{iconMapping}
and \code{getIcon}, so that the default icon is used.
}
