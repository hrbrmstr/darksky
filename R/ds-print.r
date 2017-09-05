#' Slightly more human-readable output for darksky objects
#'
#' @param x a darksky object
#' @param ... ignored
#' @export
print.darksky <- function(x, ...) {

  slots <- c("minutely", "hourly", "daily", "currently")

  cons_wd <- getOption("width")

  for (has in intersect(slots, names(x))) {

    cat(has, "\n")
    cat(padz(" ", cons_wd, "="), "\n")
    print(str(x[[has]]))
    cat("\n")

  }

}
