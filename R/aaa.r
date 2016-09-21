# stops check complaints
temperature <- humidity <- precipIntensity <- temperatureMinTime <-
  temperatureMin <- temperatureMaxTime <- temperatureMax <- NULL

# helper function to convert timestamps
# not really needed but it makes the mutate_each_ call a bit cleaner this way
convert_time <- function(x) as.POSIXct(x, origin="1970-01-01")

padz <- function(x, n=max(nchar(x)), ch=" ") gsub(" ", ch, formatC(x, width=n))
