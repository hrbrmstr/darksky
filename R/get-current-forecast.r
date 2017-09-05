#' Retrieve the current forecast (for the next week)
#'
#' The Dark Sky API lets you query for most locations on the globe, and returns:
#' \enumerate{ \item{current conditions} \item{minute-by-minute forecasts out to 1 hour
#' (where available)} \item{hour-by-hour forecasts out to 48 hours} \item{day-by-day
#' forecasts out to 7 days} }
#'
#' If you wish to have results in something besides Imperial units, set \code{units} to
#' one of (\code{si}, \code{ca}, \code{uk}). Setting \code{units} to \code{auto} will have
#' the API select the relevant units automatically, based on geographic location. This
#' value is set to \code{us} (Imperial) units by default.
#'
#' If you wish to have text summaries presented in a different language, set
#' \code{language} to one of (\code{ar}, \code{bs}, \code{de}, \code{es}, \code{fr},
#' \code{it}, \code{nl}, \code{pl}, \code{pt}, \code{ru}, \code{sv}, \code{tet},
#' \code{tr}, \code{x-pig-latin}, \code{zh}). This value is set to \code{en} (English) by
#' default.
#'
#' See the Options section of the official
#' \href{https://darksky.net/dev/docs}{Dark Sky API documentation} for more
#' information.
#' @param latitude forecast latitude (character, decimal format)
#' @param longitude forecast longitude (character, decimal format)
#' @param units return the API response in units other than the default Imperial unit
#' @param language return text summaries in the desired language
#' @param exclude exclude some number of data blocks from the API response. This is useful
#'   for reducing latency and saving cache space. This should be a comma-separated string
#'   (without spaces) including one or more of the following: (\code{currently},
#'   \code{minutely}, \code{hourly}, \code{daily}, \code{alerts}, \code{flags}). Crafting
#'   a request with all of the above blocks excluded is exceedingly silly and not
#'   recommended. Setting this parameter to \code{NULL} (the default) does not exclude any
#'   parameters from the results.
#' @param extend setting this parameter to \code{hourly} the API will return hourly data
#'   for the next seven days, rather than the next two.
#' @param add_headers add the return headers to the object?
#' @param add_json add the raw JSON response to the object?
#' @param ... pass through parameters to \code{httr::GET} (e.g. to configure ssl options
#'   or proxies)
#' @return an \code{darksky} object that contains the original JSON response object
#'   (optionally), a list of  named `tbl_df` `data.frame` objects corresponding to what
#'   was returned by the API and (optionally) relevant response headers (\code{cache-control},
#'   \code{expires}, \code{x-forecast-api-calls}, \code{x-response-time}).
#' @export
#' @examples \dontrun{
#' tmp <- get_current_forecast(37.8267, -122.423)
#' }
get_current_forecast <- function(latitude, longitude,
                                 units="us", language="en",
                                 exclude=NULL, extend=NULL,
                                 add_json=FALSE, add_headers=FALSE,
                                 ...) {

  url <- sprintf("https://api.darksky.net/forecast/%s/%s,%s",
                 darksky_api_key(), latitude, longitude)

  params <- list(units=units, language=language)

  if (!is.null(exclude)) params$exclude <- exclude
  if (!is.null(extend)) params$extend <- extend

  resp <- httr::GET(url=url, query=params, ...)
  httr::stop_for_status(resp)

  tmp <- httr::content(resp, as="parsed")

  lys <- c("hourly", "minutely", "daily")

  # hourly, minutely and daily blocks might not be in the response
  # so only process the ones that are actually in the response

  lapply(

    lys[which(lys %in% names(tmp))],

    function(x) {

      dat <- plyr::rbind.fill(lapply(tmp[[x]]$data, as.data.frame, stringsAsFactors=FALSE))

      # various time fields might not be in the block data, so only
      # process which ones are in the block data

      ftimes <- c("time", "sunriseTime", "sunsetTime", "temperatureMinTime",
                  "temperatureMaxTime", "apparentTemperatureMinTime",
                  "apparentTemperatureMaxTime", "precipIntensityMaxTime")

      # convert times to POSIXct since they make sense in tbl_dfs/data.frames

      cols <- ftimes[which(ftimes %in% colnames(dat))]
      for (col in cols) {
        dat[,col] <- convert_time(dat[,col])
      }

      dat

    }

  ) -> fio_data

  fio_data <- setNames(fio_data, lys[which(lys %in% names(tmp))])

  # add currently as a data frame to the return list since that's helpful for
  # rbinding later for folks

  if ("currently" %in% names(tmp)) {
    currently <- as.data.frame(tmp$currently, stringsAsFactors=FALSE)
    if ("time" %in% colnames(currently)) {
      currently$time <- convert_time(currently$time)
    }
    fio_data$currently <- currently
  }

  if (add_json) fio_data$json <- tmp

  ret_val <- fio_data

  if (add_headers) {
    dev_heads <- c("cache-control", "expires", "x-forecast-api-calls", "x-response-time")
    ret_heads <- httr::headers(resp)

    ret_val <- c(fio_data, ret_heads[dev_heads[which(dev_heads %in% names(ret_heads))]])
  }

  class(ret_val) <- c("darksky", "current", class(ret_val))

  return(ret_val)

}
