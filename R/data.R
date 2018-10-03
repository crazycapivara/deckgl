#' bart segments
#'
#' @format tibble with 45 rows and 8 variables:
#' \describe{
#'   \item{inbound}{number of inbound trips}
#'   \item{outbound}{number of outbound trips}
#'   \item{from_name}{source station name}
#'   \item{from_lng}{source station longitude}
#'   \item{from_lat}{source station latitude}
#'   \item{to_name}{target station name}
#'   \item{to_lng}{target station longitude}
#'   \item{to_lat}{target station latitude}
#' }
#'
#' @source \url{"https://raw.githubusercontent.com/uber-common/deck.gl-data/master/website/bart-segments.json"}
"bart_segments"

#' bart stations
#'
#' @format tibble with 44 rows and 7 variables:
#' \describe{
#'   \item{name}{station name}
#'   \item{code}{two-letter station code}
#'   \item{address}{station address}
#'   \item{entries}{number of entries}
#'   \item{exits}{number of exits}
#'   \item{lng}{station longitude}
#'   \item{lat}{station latitude}
#' }
#'
#' @source \url{"https://raw.githubusercontent.com/uber-common/deck.gl-data/master/website/bart-stations.json"}
"bart_stations"

#' sf bike parking
#'
#' @format tibble with 2520 rows and 5 variables
#'
#' @source \url{https://raw.githubusercontent.com/uber-common/deck.gl-data/master/website/sf-bike-parking.json}
"sf_bike_parking"
