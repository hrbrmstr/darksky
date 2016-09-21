#' Get or set DARKSKY_API_KEY value
#'
#' The API wrapper functions in this package all rely on a Dark Sky API
#' key residing in the environment variable \code{DARKSKY_API_KEY}. The
#' easiest way to accomplish this is to set it in the `\code{.Renviron}` file in your
#' home directory.
#'
#' @param force force setting a new Dark Sky API key for the current environment?
#' @return atomic character vector containing the Dark Sky API key
#' @export
darksky_api_key <- function(force = FALSE) {

  env <- Sys.getenv('DARKSKY_API_KEY')
  if (!identical(env, "") && !force) return(env)

  env <- Sys.getenv("FORECASTIO_API_KEY")
  if (!identical(env, "") && !force) {
    message("FORECASTIO_API_KEY is deprecated, please update environment variable to DARKSKY_API_KEY")
    return(env)
  }

  if (!interactive()) {
    stop("Please set env var DARKSKY_API_KEY to your Dark Sky API key",
      call. = FALSE)
  }

  message("Couldn't find env var DARKSKY_API_KEY See ?darksky_api_key for more details.")
  message("Please enter your API key and press enter:")
  pat <- readline(": ")

  if (identical(pat, "")) {
    stop("Dark Sky API key entry failed", call. = FALSE)
  }

  message("Updating DARKSKY_API_KEY env var to PAT")
  Sys.setenv(DARKSKY_API_KEY = pat)

  pat

}
