#' @importFrom tibble tibble
NULL

#' bart segments
#'
#' @format tibble with 45 rows and 8 variables:
#' \describe{
#'   \item{inbound}{number of inbound trips}
#'   \item{outbound}{number of outbound trips}
#'   \item{from_name}{name of source station }
#'   \item{from_lng}{longitude of source station}
#'   \item{from_lat}{latitude of source station}
#'   \item{to_name}{name of target station}
#'   \item{to_lng}{longitude of target station}
#'   \item{to_lat}{latitude of target station}
#' }
#'
#' @source \url{https://raw.githubusercontent.com/uber-common/deck.gl-data/master/website/bart-segments.json}
"bart_segments"

#' bart stations
#'
#' @format tibble with 44 rows and 7 variables:
#' \describe{
#'   \item{name}{station name}
#'   \item{code}{two-letter station code}
#'   \item{address}{address}
#'   \item{entries}{number of entries}
#'   \item{exits}{number of exits}
#'   \item{lng}{longitude}
#'   \item{lat}{latitude}
#' }
#'
#' @source \url{https://raw.githubusercontent.com/uber-common/deck.gl-data/master/website/bart-stations.json}
"bart_stations"

#' sf bike parking
#'
#' @format tibble with 2520 rows and 5 variables:
#' \describe{
#'   \item{address}{address}
#'   \item{racks}{number of racks}
#'   \item{spaces}{number of spaces}
#'   \item{lng}{longitude}
#'   \item{lat}{latidude}
#' }
#'
#' @source \url{https://raw.githubusercontent.com/uber-common/deck.gl-data/master/website/sf-bike-parking.json}
"sf_bike_parking"
