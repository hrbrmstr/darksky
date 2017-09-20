
<!-- [![Project Status: Active - The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/0.1.0/active.svg)](http://www.repostatus.org/#active)  -->
<!-- [![Coverage Status](https://img.shields.io/codecov/c/github/hrbrmstr/darksky/master.svg)](https://codecov.io/github/hrbrmstr/darksky?branch=master) -->
<!-- [![Build Status](https://travis-ci.org/hrbrmstr/darksky.svg?branch=master)](https://travis-ci.org/hrbrmstr/darksky) -->
<!-- [![Build status](https://ci.appveyor.com/api/projects/status/gq0uxmae9ii64g6q?svg=true)](https://ci.appveyor.com/project/hrbrmstr/darksky) -->
<!-- [![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/darksky)](https://cran.r-project.org/package=darksky) -->
<!-- ![downloads](http://cranlogs.r-pkg.org/badges/grand-total/darksky) -->
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
library(ggplot2)
library(purrr)

# current verison
packageVersion("darksky")
```

    ## [1] '1.3.0'

``` r
now <- get_current_forecast(43.2672, -70.8617)
print(now)
```

    ## minutely 
    ## ======================================================================================================================== 
    ## 'data.frame':    61 obs. of  3 variables:
    ##  $ time             : POSIXct, format: "2017-09-20 07:44:00" "2017-09-20 07:45:00" "2017-09-20 07:46:00" "2017-09-20 07:47:00" ...
    ##  $ precipIntensity  : int  0 0 0 0 0 0 0 0 0 0 ...
    ##  $ precipProbability: int  0 0 0 0 0 0 0 0 0 0 ...
    ## NULL
    ## 
    ## hourly 
    ## ======================================================================================================================== 
    ## 'data.frame':    49 obs. of  18 variables:
    ##  $ time               : POSIXct, format: "2017-09-20 07:00:00" "2017-09-20 08:00:00" "2017-09-20 09:00:00" "2017-09-20 10:00:00" ...
    ##  $ summary            : chr  "Overcast" "Overcast" "Overcast" "Overcast" ...
    ##  $ icon               : chr  "cloudy" "cloudy" "cloudy" "cloudy" ...
    ##  $ precipIntensity    : num  0.0015 0.0006 0.003 0.0046 0.005 0.0066 0.007 0.0073 0.0046 0.0016 ...
    ##  $ precipProbability  : num  0.05 0.07 0.09 0.11 0.11 0.12 0.11 0.11 0.08 0.05 ...
    ##  $ precipType         : chr  "rain" "rain" "rain" "rain" ...
    ##  $ temperature        : num  66.3 66.5 67 67.7 68.3 ...
    ##  $ apparentTemperature: num  67.1 67.3 67.8 68.6 69.1 ...
    ##  $ dewPoint           : num  64.9 65 65.2 65.5 65.6 ...
    ##  $ humidity           : num  0.95 0.95 0.94 0.93 0.91 0.9 0.89 0.89 0.87 0.85 ...
    ##  $ pressure           : num  1015 1015 1014 1013 1013 ...
    ##  $ windSpeed          : num  7.16 8.06 9.66 10.74 11.26 ...
    ##  $ windGust           : num  15.7 18.5 24.5 28.7 29.1 ...
    ##  $ windBearing        : int  29 31 32 34 35 35 34 29 29 31 ...
    ##  $ cloudCover         : num  1 1 1 0.99 1 0.97 0.9 0.99 1 1 ...
    ##  $ uvIndex            : int  0 0 1 2 2 3 3 2 2 1 ...
    ##  $ visibility         : num  8.49 8.42 8.41 8.38 8.54 9.23 10 10 10 10 ...
    ##  $ ozone              : num  266 267 267 267 267 ...
    ## NULL
    ## 
    ## daily 
    ## ======================================================================================================================== 
    ## 'data.frame':    8 obs. of  39 variables:
    ##  $ time                       : POSIXct, format: "2017-09-20" "2017-09-21" "2017-09-22" "2017-09-23" ...
    ##  $ summary                    : chr  "Light rain until afternoon." "Mostly cloudy throughout the day." "Partly cloudy throughout the day." "Mostly cloudy until evening." ...
    ##  $ icon                       : chr  "rain" "partly-cloudy-day" "partly-cloudy-day" "partly-cloudy-day" ...
    ##  $ sunriseTime                : POSIXct, format: "2017-09-20 06:29:59" "2017-09-21 06:31:05" "2017-09-22 06:32:11" "2017-09-23 06:33:17" ...
    ##  $ sunsetTime                 : POSIXct, format: "2017-09-20 18:46:17" "2017-09-21 18:44:28" "2017-09-22 18:42:38" "2017-09-23 18:40:48" ...
    ##  $ moonPhase                  : num  0.02 0.05 0.09 0.12 0.15 0.18 0.21 0.24
    ##  $ precipIntensity            : num  0.0039 0.0001 0.0002 0.0001 0 0.0002 0.0019 0.0043
    ##  $ precipIntensityMax         : num  0.0156 0.0002 0.0003 0.0002 0.0002 0.0007 0.0038 0.0132
    ##  $ precipIntensityMaxTime     : POSIXct, format: "2017-09-20 04:00:00" "2017-09-21 02:00:00" "2017-09-22 04:00:00" "2017-09-23 17:00:00" ...
    ##  $ precipProbability          : num  0.62 0.11 0.09 0.07 0 0.13 0.29 0.41
    ##  $ precipType                 : chr  "rain" "rain" "rain" "rain" ...
    ##  $ temperatureHigh            : num  71.4 76.3 70.4 76.3 78 ...
    ##  $ temperatureHighTime        : int  1505941200 1506024000 1506114000 1506196800 1506276000 1506369600 1506441600 1506542400
    ##  $ temperatureLow             : num  63.7 52.2 57.9 58.8 60.9 ...
    ##  $ temperatureLowTime         : int  1505991600 1506081600 1506168000 1506240000 1506312000 1506423600 1506513600 1506567600
    ##  $ apparentTemperatureHigh    : num  72.2 76.3 70.4 76.4 78.5 ...
    ##  $ apparentTemperatureHighTime: int  1505941200 1506024000 1506114000 1506196800 1506276000 1506369600 1506441600 1506542400
    ##  $ apparentTemperatureLow     : num  63.8 52.2 57.9 58.9 61.4 ...
    ##  $ apparentTemperatureLowTime : int  1505991600 1506081600 1506168000 1506240000 1506312000 1506423600 1506513600 1506567600
    ##  $ dewPoint                   : num  65 55.4 45.3 53.5 61.1 ...
    ##  $ humidity                   : num  0.91 0.65 0.56 0.68 0.84 0.88 0.83 0.86
    ##  $ pressure                   : num  1014 1017 1020 1018 1016 ...
    ##  $ windSpeed                  : num  8.8 10.68 10.53 7.22 2.42 ...
    ##  $ windGust                   : num  30 30.2 30 26.8 8.8 ...
    ##  $ windGustTime               : int  1505962800 1505966400 1506081600 1506139200 1506286800 1506380400 1506481200 1506513600
    ##  $ windBearing                : int  29 24 31 33 61 78 76 54
    ##  $ cloudCover                 : num  0.99 0.86 0.62 0.52 0.12 0.51 0.97 0.94
    ##  $ uvIndex                    : int  3 3 4 3 5 3 3 3
    ##  $ uvIndexTime                : int  1505923200 1506006000 1506096000 1506182400 1506268800 1506351600 1506441600 1506528000
    ##  $ visibility                 : num  9.28 10 10 10 NA NA NA NA
    ##  $ ozone                      : num  265 265 262 261 255 ...
    ##  $ temperatureMin             : num  65.1 62.6 52.2 57.9 58.8 ...
    ##  $ temperatureMinTime         : POSIXct, format: "2017-09-20 00:00:00" "2017-09-21 23:00:00" "2017-09-22 08:00:00" "2017-09-23 08:00:00" ...
    ##  $ temperatureMax             : num  71.4 76.3 70.4 76.3 78 ...
    ##  $ temperatureMaxTime         : POSIXct, format: "2017-09-20 17:00:00" "2017-09-21 16:00:00" "2017-09-22 17:00:00" "2017-09-23 16:00:00" ...
    ##  $ apparentTemperatureMin     : num  65.8 62.6 52.2 57.9 58.9 ...
    ##  $ apparentTemperatureMinTime : POSIXct, format: "2017-09-20 00:00:00" "2017-09-21 23:00:00" "2017-09-22 08:00:00" "2017-09-23 08:00:00" ...
    ##  $ apparentTemperatureMax     : num  72.2 76.3 70.4 76.4 78.5 ...
    ##  $ apparentTemperatureMaxTime : POSIXct, format: "2017-09-20 17:00:00" "2017-09-21 16:00:00" "2017-09-22 17:00:00" "2017-09-23 16:00:00" ...
    ## NULL
    ## 
    ## currently 
    ## ======================================================================================================================== 
    ## 'data.frame':    1 obs. of  19 variables:
    ##  $ time                : POSIXct, format: "2017-09-20 07:44:50"
    ##  $ summary             : chr "Overcast"
    ##  $ icon                : chr "cloudy"
    ##  $ nearestStormDistance: int 20
    ##  $ nearestStormBearing : int 247
    ##  $ precipIntensity     : int 0
    ##  $ precipProbability   : int 0
    ##  $ temperature         : num 66.5
    ##  $ apparentTemperature : num 67.3
    ##  $ dewPoint            : num 65.1
    ##  $ humidity            : num 0.95
    ##  $ pressure            : num 1015
    ##  $ windSpeed           : num 7.83
    ##  $ windGust            : num 17.8
    ##  $ windBearing         : int 30
    ##  $ cloudCover          : int 1
    ##  $ uvIndex             : int 0
    ##  $ visibility          : num 8.44
    ##  $ ozone               : num 266
    ## NULL

Historical (using `Date` objects):

``` r
seq(Sys.Date()-10, Sys.Date(), "1 day") %>% 
  map(~get_forecast_for(43.2672, -70.8617, .x)) %>% 
  map_df("hourly") %>% 
  ggplot(aes(x=time, y=temperature)) +
  geom_line()
```

![](README_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-5-1.png)

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
                            lat=c(43.2672, 47.6097),
                            lon=c(70.8617, 122.3331),
                            when=c("2013-05-06T12:00:00-0400",
                                   "2013-05-06T12:00:00-0400"),
                            stringsAsFactors=FALSE)

bigger_list <- pmap(list(more_than_one$lat, more_than_one$lon,
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

    ## [1] "You have used 356 API calls."

``` r
plot(now)
```

![](README_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-6-1.png)

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

    ## [1] "Wed Sep 20 07:44:56 2017"

``` r
test_dir("tests/")
```

    ## testthat results ========================================================================================================
    ## OK: 4 SKIPPED: 0 FAILED: 0
    ## 
    ## DONE ===================================================================================================================
