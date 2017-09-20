# stops check complaints
utils::globalVariables(c("temperature", "humidity", "precipIntensity",
                         "temperatureMinTime", "temperatureMin", "temperatureMaxTime",
                         "temperatureMax"))

# helper function to convert timestamps
# not really needed but it makes the mutate_each_ call a bit cleaner this way
convert_time <- function(x) as.POSIXct(x, origin="1970-01-01")

# and the reverse
ts_to_iso8601 <- function(x) format(x, "%Y-%m-%dT%H:%M:%S%z")

# string padding helper
padz <- function(x, n=max(nchar(x)), ch=" ") gsub(" ", ch, formatC(x, width=n))
