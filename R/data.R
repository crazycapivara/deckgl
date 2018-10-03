#' bart segments
#'
#' @format tibble with 45 rows and 8 variables:
#' \describe{
#'   \item{inbound}{inbound trips}
#'   \item{outbound}{outbound trips}
#'   \item{from_name}{name of source station}
#'   \item{from_lng}{longitude of source station}
#'   \item{from_lat}{latitude of source station}
#'   \item{to_name}{name of target station}
#'   \item{to_lng}{longitude of target station}
#'   \item{to_lat}{latitude of target station}
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
#'   \item{entries}{entries at station}
#'   \item{exits}{exits at station}
#'   \item{lng}{station longitude}
#'   \item{lat}{station latitude}
#' }
#'
#' @source \url{"https://raw.githubusercontent.com/uber-common/deck.gl-data/master/website/bart-stations.json"}
"bart_stations"
