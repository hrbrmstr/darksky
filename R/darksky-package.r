#' Tools to Work with the Dark Sky API
#'
#' Programmatic access to the Dark Sky API <https://darksky.net/dev/docs>,
#' which provides current or historical global weather conditions.
#'
#' @name darksky
#' @docType package
#' @author Bob Rudis (bob@@rud.is)
#' @importFrom plyr rbind.fill
#' @importFrom httr GET content stop_for_status headers
#' @importFrom grid unit
#' @importFrom gridExtra grid.arrange
#' @import ggplot2
#' @importFrom stats setNames time
#' @importFrom utils str
#' @import gtable
NULL
