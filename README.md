
[![Project Status: Active - The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/0.1.0/active.svg)](http://www.repostatus.org/#active) [![Build Status](https://travis-ci.org/hrbrmstr/darksky.svg)](https://travis-ci.org/hrbrmstr/darksky) [![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/darksky)](https://cran.r-project.org/package=darksky) ![downloads](http://cranlogs.r-pkg.org/badges/grand-total/darksky)

`darksky` : Tools to Work with the Dark Sky API

-   Dark Sky API Docs: <https://darksky.net/dev/docs>
-   Dark Sky Dev site: <https://darksky.net/dev/>

The following functions are implemented:

-   `darksky_api_key` : Get or set `DARKSKY_API_KEY` value
-   `get_current_forecast` : Retrieve the current forecast (for the next week)
-   `get_forecast_for` : Retrieve weather data for a specific place/time
-   `plot.darksky` : Plot method for `darksky` objects
-   `print.darksky` : A tad more human readable default printing

### Installation

``` r
devtools::install_github("hrbrmstr/darksky")
```

OR

``` r
devtools::install.packages("darksky")
```

### Usage

``` r
library(darksky)
library(purrr)

# current verison
packageVersion("darksky")
```

    ## [1] '1.2.0'

``` r
now <- get_current_forecast(43.2672, -70.8617)
print(now)
```

    ## minutely 
    ## ======================================================================================================================== 
    ## 'data.frame':    61 obs. of  3 variables:
    ##  $ time             : POSIXct, format: "2017-09-05 15:04:00" "2017-09-05 15:05:00" "2017-09-05 15:06:00" "2017-09-05 15:07:00" ...
    ##  $ precipIntensity  : int  0 0 0 0 0 0 0 0 0 0 ...
    ##  $ precipProbability: int  0 0 0 0 0 0 0 0 0 0 ...
    ## NULL
    ## 
    ## hourly 
    ## ======================================================================================================================== 
    ## 'data.frame':    49 obs. of  18 variables:
    ##  $ time               : POSIXct, format: "2017-09-05 15:00:00" "2017-09-05 16:00:00" "2017-09-05 17:00:00" "2017-09-05 18:00:00" ...
    ##  $ summary            : chr  "Clear" "Partly Cloudy" "Drizzle" "Drizzle" ...
    ##  $ icon               : chr  "clear-day" "partly-cloudy-day" "rain" "rain" ...
    ##  $ precipIntensity    : num  0.0045 0.0027 0.0085 0.0084 0.0065 0.0056 0.0052 0.0007 0.0005 0.0009 ...
    ##  $ precipProbability  : num  0.13 0.14 0.15 0.17 0.17 0.14 0.12 0.04 0.05 0.06 ...
    ##  $ precipType         : chr  "rain" "rain" "rain" "rain" ...
    ##  $ temperature        : num  81.7 81.3 80.6 77.8 74.3 ...
    ##  $ apparentTemperature: num  84.7 84.2 83 78.5 75 ...
    ##  $ dewPoint           : num  68.1 68.3 67 66.8 65.9 ...
    ##  $ humidity           : num  0.64 0.65 0.63 0.69 0.75 0.77 0.81 0.85 0.89 0.92 ...
    ##  $ pressure           : num  1005 1005 1005 1006 1006 ...
    ##  $ windSpeed          : num  9.73 9.88 10.54 8.53 8.38 ...
    ##  $ windGust           : num  22.1 20.8 23.9 18.6 16.9 ...
    ##  $ windBearing        : int  201 194 197 211 183 194 200 212 213 204 ...
    ##  $ cloudCover         : num  0.18 0.44 0.42 0.41 0.6 0.65 0.72 0.81 0.62 0.89 ...
    ##  $ uvIndex            : int  3 2 1 0 0 0 0 0 0 0 ...
    ##  $ visibility         : num  9.91 10 10 10 9.78 10 10 9.99 9.67 9.68 ...
    ##  $ ozone              : num  297 297 298 298 297 ...
    ## NULL
    ## 
    ## daily 
    ## ======================================================================================================================== 
    ## 'data.frame':    8 obs. of  39 variables:
    ##  $ time                       : POSIXct, format: "2017-09-05" "2017-09-06" "2017-09-07" "2017-09-08" ...
    ##  $ summary                    : chr  "Drizzle in the evening and overnight." "Heavy rain throughout the day." "Rain in the morning." "Partly cloudy starting in the afternoon." ...
    ##  $ icon                       : chr  "rain" "rain" "rain" "partly-cloudy-day" ...
    ##  $ sunriseTime                : POSIXct, format: "2017-09-05 06:13:38" "2017-09-06 06:14:43" "2017-09-07 06:15:49" "2017-09-08 06:16:54" ...
    ##  $ sunsetTime                 : POSIXct, format: "2017-09-05 19:13:30" "2017-09-06 19:11:43" "2017-09-07 19:09:56" "2017-09-08 19:08:09" ...
    ##  $ moonPhase                  : num  0.48 0.51 0.54 0.58 0.62 0.65 0.69 0.73
    ##  $ precipIntensity            : num  0.0024 0.0435 0.0614 0.001 0.0043 0.0025 0.0001 0.0001
    ##  $ precipIntensityMax         : num  0.0085 0.134 0.2805 0.0044 0.0237 ...
    ##  $ precipIntensityMaxTime     : POSIXct, format: "2017-09-05 17:00:00" "2017-09-06 11:00:00" "2017-09-07 02:00:00" "2017-09-08 21:00:00" ...
    ##  $ precipProbability          : num  0.41 0.92 0.96 0.14 0.2 0.29 0.12 0.05
    ##  $ precipType                 : chr  "rain" "rain" "rain" "rain" ...
    ##  $ temperatureHigh            : num  81.7 72.8 71.5 68.3 64.7 ...
    ##  $ temperatureHighTime        : int  1504638000 1504728000 1504814400 1504893600 1504976400 1505070000 1505156400 1505242800
    ##  $ temperatureLow             : num  66.2 62.8 53.1 49.6 48.6 ...
    ##  $ temperatureLowTime         : int  1504692000 1504785600 1504864800 1504951200 1505030400 1505116800 1505210400 1505275200
    ##  $ apparentTemperatureHigh    : num  84.7 74 71.5 68.3 64.7 ...
    ##  $ apparentTemperatureHighTime: int  1504638000 1504728000 1504814400 1504893600 1504976400 1505070000 1505156400 1505242800
    ##  $ apparentTemperatureLow     : num  67.2 63.4 53.1 48.3 46.6 ...
    ##  $ apparentTemperatureLowTime : int  1504692000 1504785600 1504864800 1504951200 1505030400 1505116800 1505210400 1505275200
    ##  $ dewPoint                   : num  63.9 67.2 60.8 50.9 49.7 ...
    ##  $ humidity                   : num  0.79 0.95 0.87 0.75 0.81 0.77 0.65 0.71
    ##  $ pressure                   : num  1007 1011 1008 1015 1021 ...
    ##  $ windSpeed                  : num  6.46 4.17 5.62 5.54 1.74 4.98 5.38 2.31
    ##  $ windGust                   : num  23.86 26.07 28.8 23.06 9.59 ...
    ##  $ windGustTime               : int  1504645200 1504753200 1504764000 1504846800 1504958400 1505073600 1505127600 1505250000
    ##  $ windBearing                : int  203 170 231 262 321 342 323 271
    ##  $ cloudCover                 : num  0.29 0.94 0.7 0.2 0.16 0.14 0.08 0.89
    ##  $ uvIndex                    : int  6 3 4 6 5 5 6 4
    ##  $ uvIndexTime                : int  1504627200 1504710000 1504803600 1504890000 1504972800 1505059200 1505145600 1505235600
    ##  $ visibility                 : num  10 9.85 10 10 NA NA NA NA
    ##  $ ozone                      : num  299 292 297 320 326 ...
    ##  $ temperatureMin             : num  62.1 66.2 58.1 52.5 49.6 ...
    ##  $ temperatureMinTime         : POSIXct, format: "2017-09-05 02:00:00" "2017-09-06 06:00:00" "2017-09-07 23:00:00" "2017-09-08 23:00:00" ...
    ##  $ temperatureMax             : num  81.7 72.8 71.5 68.3 64.7 ...
    ##  $ temperatureMaxTime         : POSIXct, format: "2017-09-05 15:00:00" "2017-09-06 16:00:00" "2017-09-07 16:00:00" "2017-09-08 14:00:00" ...
    ##  $ apparentTemperatureMin     : num  62.1 67.2 58.1 52.5 48.3 ...
    ##  $ apparentTemperatureMinTime : POSIXct, format: "2017-09-05 02:00:00" "2017-09-06 06:00:00" "2017-09-07 23:00:00" "2017-09-08 23:00:00" ...
    ##  $ apparentTemperatureMax     : num  84.7 74 71.5 68.3 64.7 ...
    ##  $ apparentTemperatureMaxTime : POSIXct, format: "2017-09-05 15:00:00" "2017-09-06 16:00:00" "2017-09-07 16:00:00" "2017-09-08 14:00:00" ...
    ## NULL
    ## 
    ## currently 
    ## ======================================================================================================================== 
    ## 'data.frame':    1 obs. of  19 variables:
    ##  $ time                : POSIXct, format: "2017-09-05 15:04:43"
    ##  $ summary             : chr "Clear"
    ##  $ icon                : chr "clear-day"
    ##  $ nearestStormDistance: int 39
    ##  $ nearestStormBearing : int 275
    ##  $ precipIntensity     : int 0
    ##  $ precipProbability   : int 0
    ##  $ temperature         : num 81.7
    ##  $ apparentTemperature : num 84.7
    ##  $ dewPoint            : num 68.2
    ##  $ humidity            : num 0.64
    ##  $ pressure            : num 1005
    ##  $ windSpeed           : num 9.73
    ##  $ windGust            : num 22
    ##  $ windBearing         : int 200
    ##  $ cloudCover          : num 0.2
    ##  $ uvIndex             : int 3
    ##  $ visibility          : int 10
    ##  $ ozone               : num 297
    ## NULL

``` r
then <- get_forecast_for(43.2672, -70.8617, "2013-05-06T12:00:00-0400", add_headers=TRUE)
print(then)
```

    ## hourly 
    ## ======================================================================================================================== 
    ## 'data.frame':    24 obs. of  15 variables:
    ##  $ time               : POSIXct, format: "2013-05-06 00:00:00" "2013-05-06 01:00:00" "2013-05-06 02:00:00" "2013-05-06 03:00:00" ...
    ##  $ summary            : chr  "Clear" "Clear" "Clear" "Clear" ...
    ##  $ icon               : chr  "clear-night" "clear-night" "clear-night" "clear-night" ...
    ##  $ precipIntensity    : int  0 0 0 0 0 0 0 0 0 0 ...
    ##  $ precipProbability  : int  0 0 0 0 0 0 0 0 0 0 ...
    ##  $ temperature        : num  40.3 38.8 37.6 36.1 34.4 ...
    ##  $ apparentTemperature: num  38.4 38.8 37.6 36.1 34.4 ...
    ##  $ dewPoint           : num  36.5 35.6 35.2 34.2 32.7 ...
    ##  $ humidity           : num  0.86 0.88 0.91 0.92 0.93 0.95 0.94 0.92 0.85 0.81 ...
    ##  $ pressure           : num  1025 1025 1024 1024 1024 ...
    ##  $ windSpeed          : num  3.28 2.31 2.36 1.19 2.2 2.86 1.95 2.16 4.16 5.3 ...
    ##  $ windBearing        : int  197 186 193 250 285 247 301 233 197 172 ...
    ##  $ cloudCover         : num  0 0 0 0 0 0.02 0.03 0.2 0.23 0.02 ...
    ##  $ uvIndex            : int  0 0 0 0 0 0 0 1 1 3 ...
    ##  $ visibility         : num  9.36 8.18 8.49 7.98 6.89 6.71 6.08 7.56 7.89 9.28 ...
    ## NULL
    ## 
    ## daily 
    ## ======================================================================================================================== 
    ## 'data.frame':    1 obs. of  34 variables:
    ##  $ time                       : POSIXct, format: "2013-05-06"
    ##  $ summary                    : chr "Foggy overnight."
    ##  $ icon                       : chr "fog"
    ##  $ sunriseTime                : POSIXct, format: "2013-05-06 05:30:54"
    ##  $ sunsetTime                 : POSIXct, format: "2013-05-06 19:51:43"
    ##  $ moonPhase                  : num 0.9
    ##  $ precipIntensity            : int 0
    ##  $ precipIntensityMax         : int 0
    ##  $ precipProbability          : int 0
    ##  $ temperatureHigh            : num 60.3
    ##  $ temperatureHighTime        : int 1367863200
    ##  $ temperatureLow             : num 43.4
    ##  $ temperatureLowTime         : int 1367920800
    ##  $ apparentTemperatureHigh    : num 60.3
    ##  $ apparentTemperatureHighTime: int 1367863200
    ##  $ apparentTemperatureLow     : num 43.2
    ##  $ apparentTemperatureLowTime : int 1367899200
    ##  $ dewPoint                   : num 40.2
    ##  $ humidity                   : num 0.78
    ##  $ pressure                   : num 1023
    ##  $ windSpeed                  : num 4.01
    ##  $ windBearing                : int 161
    ##  $ cloudCover                 : num 0.05
    ##  $ uvIndex                    : int 9
    ##  $ uvIndexTime                : int 1367859600
    ##  $ visibility                 : num 7.8
    ##  $ temperatureMin             : num 34.3
    ##  $ temperatureMinTime         : POSIXct, format: "2013-05-06 05:00:00"
    ##  $ temperatureMax             : num 60.3
    ##  $ temperatureMaxTime         : POSIXct, format: "2013-05-06 14:00:00"
    ##  $ apparentTemperatureMin     : num 34.3
    ##  $ apparentTemperatureMinTime : POSIXct, format: "2013-05-06 05:00:00"
    ##  $ apparentTemperatureMax     : num 60.3
    ##  $ apparentTemperatureMaxTime : POSIXct, format: "2013-05-06 14:00:00"
    ## NULL
    ## 
    ## currently 
    ## ======================================================================================================================== 
    ## 'data.frame':    1 obs. of  15 variables:
    ##  $ time               : POSIXct, format: "2013-05-06 12:00:00"
    ##  $ summary            : chr "Clear"
    ##  $ icon               : chr "clear-day"
    ##  $ precipIntensity    : int 0
    ##  $ precipProbability  : int 0
    ##  $ temperature        : num 58.1
    ##  $ apparentTemperature: num 58.1
    ##  $ dewPoint           : num 41.9
    ##  $ humidity           : num 0.55
    ##  $ pressure           : num 1024
    ##  $ windSpeed          : num 5.58
    ##  $ windBearing        : int 147
    ##  $ cloudCover         : num 0.04
    ##  $ uvIndex            : int 8
    ##  $ visibility         : num 9.47
    ## NULL

``` r
# getting data for more than one location

more_than_one <- data.frame(loc=c("Maine", "Seattle"),
                            lon=c(43.2672, 47.6097),
                            lat=c(70.8617, 122.3331),
                            when=c("2013-05-06T12:00:00-0400",
                                   "2013-05-06T12:00:00-0400"),
                            stringsAsFactors=FALSE)

bigger_list <- pmap(list(more_than_one$lon, more_than_one$lat,
                         more_than_one$when),
                    get_forecast_for)
names(bigger_list) <- more_than_one$loc

bigger_list$Seattle
```

    ## hourly 
    ## ======================================================================================================================== 
    ## 'data.frame':    24 obs. of  14 variables:
    ##  $ time               : POSIXct, format: "2013-05-06 12:00:00" "2013-05-06 13:00:00" "2013-05-06 14:00:00" "2013-05-06 15:00:00" ...
    ##  $ summary            : chr  "Mostly Cloudy" "Partly Cloudy" "Partly Cloudy" "Partly Cloudy" ...
    ##  $ icon               : chr  "partly-cloudy-night" "partly-cloudy-night" "partly-cloudy-night" "partly-cloudy-night" ...
    ##  $ precipType         : chr  "rain" "rain" "rain" "rain" ...
    ##  $ temperature        : num  57.4 55.8 54.5 53.3 52.4 ...
    ##  $ apparentTemperature: num  57.4 55.8 54.5 53.3 52.4 ...
    ##  $ dewPoint           : num  37 37.9 38.5 38.5 38.4 ...
    ##  $ humidity           : num  0.46 0.51 0.54 0.57 0.59 0.58 0.53 0.46 0.39 0.33 ...
    ##  $ pressure           : num  1014 1013 1013 1013 1013 ...
    ##  $ windSpeed          : num  3.84 4.39 4.78 4.61 4.28 4.45 5.59 7.2 8.45 8.99 ...
    ##  $ windBearing        : int  182 176 174 176 181 186 188 189 190 193 ...
    ##  $ cloudCover         : num  0.62 0.41 0.29 0.4 0.61 0.75 0.73 0.63 0.56 0.58 ...
    ##  $ uvIndex            : int  0 0 0 0 0 0 0 1 2 3 ...
    ##  $ visibility         : num  9.65 9.42 9.25 9.21 9.23 9.25 9.24 9.23 9.25 9.3 ...
    ## NULL
    ## 
    ## daily 
    ## ======================================================================================================================== 
    ## 'data.frame':    1 obs. of  32 variables:
    ##  $ time                       : POSIXct, format: "2013-05-06 12:00:00"
    ##  $ summary                    : chr "Mostly cloudy throughout the day."
    ##  $ icon                       : chr "partly-cloudy-day"
    ##  $ sunriseTime                : POSIXct, format: "2013-05-06 16:25:51"
    ##  $ sunsetTime                 : POSIXct, format: "2013-05-07 07:11:10"
    ##  $ moonPhase                  : num 0.91
    ##  $ precipType                 : chr "rain"
    ##  $ temperatureHigh            : num 84.5
    ##  $ temperatureHighTime        : int 1367913600
    ##  $ temperatureLow             : num 59.2
    ##  $ temperatureLowTime         : int 1367956800
    ##  $ apparentTemperatureHigh    : num 84.5
    ##  $ apparentTemperatureHighTime: int 1367913600
    ##  $ apparentTemperatureLow     : num 59.2
    ##  $ apparentTemperatureLowTime : int 1367956800
    ##  $ dewPoint                   : num 37.3
    ##  $ humidity                   : num 0.35
    ##  $ pressure                   : num 1009
    ##  $ windSpeed                  : num 6.5
    ##  $ windBearing                : int 192
    ##  $ cloudCover                 : num 0.62
    ##  $ uvIndex                    : int 5
    ##  $ uvIndexTime                : int 1367895600
    ##  $ visibility                 : num 9.36
    ##  $ temperatureMin             : num 52.4
    ##  $ temperatureMinTime         : POSIXct, format: "2013-05-06 16:00:00"
    ##  $ temperatureMax             : num 84.5
    ##  $ temperatureMaxTime         : POSIXct, format: "2013-05-07 04:00:00"
    ##  $ apparentTemperatureMin     : num 52.4
    ##  $ apparentTemperatureMinTime : POSIXct, format: "2013-05-06 16:00:00"
    ##  $ apparentTemperatureMax     : num 84.5
    ##  $ apparentTemperatureMaxTime : POSIXct, format: "2013-05-07 04:00:00"
    ## NULL
    ## 
    ## currently 
    ## ======================================================================================================================== 
    ## 'data.frame':    1 obs. of  14 variables:
    ##  $ time               : POSIXct, format: "2013-05-06 12:00:00"
    ##  $ summary            : chr "Mostly Cloudy"
    ##  $ icon               : chr "partly-cloudy-night"
    ##  $ precipType         : chr "rain"
    ##  $ temperature        : num 57.4
    ##  $ apparentTemperature: num 57.4
    ##  $ dewPoint           : num 37
    ##  $ humidity           : num 0.46
    ##  $ pressure           : num 1014
    ##  $ windSpeed          : num 3.84
    ##  $ windBearing        : int 182
    ##  $ cloudCover         : num 0.62
    ##  $ uvIndex            : int 0
    ##  $ visibility         : num 9.65
    ## NULL

``` r
bigger_list$Maine
```

    ## hourly 
    ## ======================================================================================================================== 
    ## 'data.frame':    24 obs. of  14 variables:
    ##  $ time               : POSIXct, format: "2013-05-05 14:00:00" "2013-05-05 15:00:00" "2013-05-05 16:00:00" "2013-05-05 17:00:00" ...
    ##  $ summary            : chr  "Clear" "Clear" "Clear" "Clear" ...
    ##  $ icon               : chr  "clear-night" "clear-night" "clear-night" "clear-night" ...
    ##  $ precipType         : chr  "rain" "rain" "rain" "rain" ...
    ##  $ temperature        : num  53.5 52.4 51.2 49.3 51 ...
    ##  $ apparentTemperature: num  53.5 52.4 51.2 49.3 51 ...
    ##  $ dewPoint           : num  36.7 36.5 40.4 37.6 38 ...
    ##  $ humidity           : num  0.53 0.55 0.66 0.64 0.61 0.63 0.62 0.59 0.47 0.45 ...
    ##  $ pressure           : num  1020 NA NA 1020 NA ...
    ##  $ windSpeed          : num  4.72 3.32 13 1.86 2.05 3.49 1.91 3.97 13 2.65 ...
    ##  $ windBearing        : int  49 48 70 96 101 134 133 177 60 51 ...
    ##  $ cloudCover         : num  0 0 0 0 0 0 0.15 0 0 0 ...
    ##  $ uvIndex            : int  0 0 0 0 0 0 0 0 1 2 ...
    ##  $ visibility         : num  7.62 6.2 6.2 7.62 6.2 6.2 9.15 6.2 6.2 9.15 ...
    ## NULL
    ## 
    ## daily 
    ## ======================================================================================================================== 
    ## 'data.frame':    1 obs. of  32 variables:
    ##  $ time                       : POSIXct, format: "2013-05-05 14:00:00"
    ##  $ summary                    : chr "Clear throughout the day."
    ##  $ icon                       : chr "clear-day"
    ##  $ sunriseTime                : POSIXct, format: "2013-05-05 20:04:31"
    ##  $ sunsetTime                 : POSIXct, format: "2013-05-06 10:24:22"
    ##  $ moonPhase                  : num 0.88
    ##  $ precipType                 : chr "rain"
    ##  $ temperatureHigh            : num 75.3
    ##  $ temperatureHighTime        : int 1367827200
    ##  $ temperatureLow             : num 47.6
    ##  $ temperatureLowTime         : int 1367881200
    ##  $ apparentTemperatureHigh    : num 75.3
    ##  $ apparentTemperatureHighTime: int 1367827200
    ##  $ apparentTemperatureLow     : num 45.4
    ##  $ apparentTemperatureLowTime : int 1367881200
    ##  $ dewPoint                   : num 37.6
    ##  $ humidity                   : num 0.42
    ##  $ pressure                   : num 1018
    ##  $ windSpeed                  : num 8.31
    ##  $ windBearing                : int 62
    ##  $ cloudCover                 : num 0.02
    ##  $ uvIndex                    : int 9
    ##  $ uvIndexTime                : int 1367823600
    ##  $ visibility                 : num 7.02
    ##  $ temperatureMin             : num 49.3
    ##  $ temperatureMinTime         : POSIXct, format: "2013-05-05 17:00:00"
    ##  $ temperatureMax             : num 75.3
    ##  $ temperatureMaxTime         : POSIXct, format: "2013-05-06 04:00:00"
    ##  $ apparentTemperatureMin     : num 49.3
    ##  $ apparentTemperatureMinTime : POSIXct, format: "2013-05-05 17:00:00"
    ##  $ apparentTemperatureMax     : num 75.3
    ##  $ apparentTemperatureMaxTime : POSIXct, format: "2013-05-06 04:00:00"
    ## NULL
    ## 
    ## currently 
    ## ======================================================================================================================== 
    ## 'data.frame':    1 obs. of  13 variables:
    ##  $ time               : POSIXct, format: "2013-05-06 12:00:00"
    ##  $ summary            : chr "Clear"
    ##  $ icon               : chr "clear-night"
    ##  $ precipType         : chr "rain"
    ##  $ temperature        : num 67.2
    ##  $ apparentTemperature: num 67.2
    ##  $ dewPoint           : num 33.2
    ##  $ humidity           : num 0.28
    ##  $ windSpeed          : num 11.2
    ##  $ windBearing        : int 72
    ##  $ cloudCover         : int 0
    ##  $ uvIndex            : int 0
    ##  $ visibility         : num 6.2
    ## NULL

``` r
print(sprintf("You have used %s API calls.", then$`x-forecast-api-calls`))
```

    ## [1] "You have used 9 API calls."

``` r
plot(now)
```

![](README_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-4-1.png)

### Test Results

``` r
library(darksky)
library(testthat)
```

    ## 
    ## Attaching package: 'testthat'

    ## The following object is masked from 'package:purrr':
    ## 
    ##     is_null

``` r
date()
```

    ## [1] "Tue Sep  5 15:04:48 2017"

``` r
test_dir("tests/")
```

    ## testthat results ========================================================================================================
    ## OK: 4 SKIPPED: 0 FAILED: 0
    ## 
    ## DONE ===================================================================================================================
