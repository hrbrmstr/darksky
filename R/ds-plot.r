#' Plot method for darksky objects
#'
#' Uses ggplot2 & grid.arrange to produce graphs for darksky objects
#'
#' @param x a darksky x
#' @param \dots ignored
#' @param readings specify which readings to plot. will plot all available by default
#' @return frame grob
#' @note only forecast/readings components of \code{x} that have more than one observation
#'   will be plotted
#' @export
#' @method plot darksky
plot.darksky <- function(x, ..., readings=c("hourly", "minutely", "daily")) {

  has <- intersect(readings, names(x))
  rows <- sapply(has, function(y) nrow(x[[y]]))
  has <- names(which(rows>1))

  lapply(has, function(rdng) {

    gg <- ggplot()

    if (rdng == "hourly") {
      gg <- gg + geom_line(data=x[[rdng]], aes(x=time, y=temperature, color="Temperature"))
      if ("humidity" %in% colnames(x[[rdng]])) {
        gg <- gg + geom_line(data=x[[rdng]], aes(x=time, y=humidity*10, color="Humidity"))
      }
      gg <- gg + scale_color_manual(name="Readings", values=c("green", "red"))

    }

    if (rdng == "minutely") {
      gg <- gg + geom_line(data=x[[rdng]], aes(x=time, y=precipIntensity, color="Precipitation\nIntensity"))
      gg <- gg + scale_color_manual(name="Readings", values=c("blue"))
    }

    if (rdng == "daily") {
      gg <- gg + geom_line(data=x[[rdng]], aes(x=temperatureMinTime, y=temperatureMin, color="Temp (min)"), linetype=2)
      gg <- gg + geom_line(data=x[[rdng]], aes(x=temperatureMaxTime, y=temperatureMax, color="Temp (max)"))
      if ("humidity" %in% colnames(x[[rdng]])) {
        gg <- gg + geom_line(data=x[[rdng]], aes(x=time, y=humidity*100, color="Humidity"))
      }
      gg <- gg + scale_color_manual(name="Readings", values=c("green", "red", "red"))
    }

    gg <- gg + labs(x=NULL, y=NULL, title=sprintf("%s readings", rdng))
    gg <- gg + theme_bw()

    gg

  }) -> the_plots

  do.call(gridExtra::grid.arrange, c(the_plots, ncol=1))

}
