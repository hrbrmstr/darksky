
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

    ## [1] '1.1.0'

``` r
now <- get_current_forecast(43.2672, -70.8617)
print(now)
```

    ## minutely 
    ## ======================================================================================================================== 
    ## Observations: 61
    ## Variables: 3
    ## $ time              <dttm> 2017-06-26 12:08:00, 2017-06-26 12:09:00, 2017-06-26 12:10:00, 2017-06-26 12:11:00, 2017...
    ## $ precipIntensity   <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,...
    ## $ precipProbability <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,...
    ## 
    ## hourly 
    ## ======================================================================================================================== 
    ## Observations: 49
    ## Variables: 18
    ## $ time                <dttm> 2017-06-26 12:00:00, 2017-06-26 13:00:00, 2017-06-26 14:00:00, 2017-06-26 15:00:00, 20...
    ## $ summary             <chr> "Clear", "Clear", "Clear", "Clear", "Clear", "Clear", "Partly Cloudy", "Partly Cloudy",...
    ## $ icon                <chr> "clear-day", "clear-day", "clear-day", "clear-day", "clear-day", "clear-day", "partly-c...
    ## $ precipIntensity     <dbl> 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0021, 0.0023, 0.0041, 0.0040, 0.0000,...
    ## $ precipProbability   <dbl> 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.01, 0.01, 0.03, 0.02, 0.00, 0.00, 0.00, 0.00, 0.0...
    ## $ temperature         <dbl> 71.99, 73.60, 74.73, 75.34, 74.83, 73.83, 72.35, 69.88, 67.86, 65.76, 63.91, 62.32, 61....
    ## $ apparentTemperature <dbl> 69.20, 70.99, 72.16, 72.90, 72.31, 72.19, 70.97, 69.47, 67.57, 65.49, 63.04, 61.58, 60....
    ## $ dewPoint            <dbl> 51.71, 51.91, 52.24, 52.48, 52.94, 53.78, 54.25, 54.83, 54.79, 54.11, 52.93, 52.28, 52....
    ## $ humidity            <dbl> 0.49, 0.47, 0.45, 0.45, 0.46, 0.50, 0.53, 0.59, 0.63, 0.66, 0.67, 0.70, 0.72, 0.76, 0.7...
    ## $ windSpeed           <dbl> 8.08, 7.93, 8.05, 7.93, 8.19, 6.74, 6.31, 4.46, 4.06, 3.61, 4.21, 3.62, 3.06, 2.96, 3.8...
    ## $ windGust            <dbl> 16.88, 17.34, 16.71, 15.61, 14.62, 11.02, 11.97, 8.71, 7.65, 6.80, 6.70, 5.80, 4.61, 4....
    ## $ windBearing         <int> 298, 238, 262, 271, 237, 243, 248, 275, 239, 252, 273, 268, 227, 205, 256, 247, 255, 25...
    ## $ visibility          <dbl> 10.00, 10.00, 10.00, 10.00, 10.00, 10.00, 10.00, 10.00, 10.00, 9.95, 10.00, 10.00, 10.0...
    ## $ cloudCover          <dbl> 0.01, 0.05, 0.03, 0.09, 0.17, 0.22, 0.26, 0.28, 0.32, 0.28, 0.21, 0.17, 0.15, 0.15, 0.1...
    ## $ pressure            <dbl> 1014.07, 1013.63, 1013.35, 1013.18, 1013.10, 1013.21, 1013.22, 1013.26, 1013.51, 1013.8...
    ## $ ozone               <dbl> 343.41, 340.55, 337.97, 335.72, 333.66, 332.55, 332.72, 333.84, 335.41, 337.21, 339.56,...
    ## $ uvIndex             <int> 9, 9, 8, 6, 3, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 2, 3, 5, 6, 6, 6, 4, 2, ...
    ## $ precipType          <chr> NA, NA, NA, NA, NA, NA, "rain", "rain", "rain", "rain", NA, NA, NA, NA, NA, NA, NA, NA,...
    ## 
    ## daily 
    ## ======================================================================================================================== 
    ## Observations: 8
    ## Variables: 30
    ## $ time                       <dttm> 2017-06-26, 2017-06-27, 2017-06-28, 2017-06-29, 2017-06-30, 2017-07-01, 2017-07...
    ## $ summary                    <chr> "Partly cloudy in the evening.", "Light rain starting in the afternoon, continui...
    ## $ icon                       <chr> "partly-cloudy-day", "rain", "partly-cloudy-day", "rain", "rain", "rain", "rain"...
    ## $ sunriseTime                <dttm> 2017-06-26 05:06:11, 2017-06-27 05:06:34, 2017-06-28 05:06:59, 2017-06-29 05:07...
    ## $ sunsetTime                 <dttm> 2017-06-26 20:28:55, 2017-06-27 20:28:55, 2017-06-28 20:28:52, 2017-06-29 20:28...
    ## $ moonPhase                  <dbl> 0.10, 0.13, 0.17, 0.20, 0.24, 0.27, 0.30, 0.33
    ## $ precipIntensity            <dbl> 0.0010, 0.0068, 0.0003, 0.0048, 0.0085, 0.0114, 0.0079, 0.0000
    ## $ precipIntensityMax         <dbl> 0.0041, 0.0297, 0.0015, 0.0331, 0.0404, 0.0525, 0.0265, 0.0000
    ## $ precipIntensityMaxTime     <dttm> 2017-06-26 20:00:00, 2017-06-27 14:00:00, 2017-06-28 00:00:00, 2017-06-29 23:00...
    ## $ precipProbability          <dbl> 0.09, 0.54, 0.02, 0.38, 0.60, 0.44, 0.50, 0.00
    ## $ precipType                 <chr> "rain", "rain", "rain", "rain", "rain", "rain", "rain", NA
    ## $ temperatureMin             <dbl> 58.21, 55.97, 54.96, 58.55, 65.02, 66.42, 65.00, 63.05
    ## $ temperatureMinTime         <dttm> 2017-06-26 04:00:00, 2017-06-27 05:00:00, 2017-06-28 05:00:00, 2017-06-29 04:00...
    ## $ temperatureMax             <dbl> 75.34, 74.38, 75.30, 77.81, 83.23, 77.02, 76.92, 80.06
    ## $ temperatureMaxTime         <dttm> 2017-06-26 15:00:00, 2017-06-27 13:00:00, 2017-06-28 16:00:00, 2017-06-29 14:00...
    ## $ apparentTemperatureMin     <dbl> 56.42, 54.75, 52.62, 56.05, 63.17, 67.86, 65.80, 61.32
    ## $ apparentTemperatureMinTime <dttm> 2017-06-26 04:00:00, 2017-06-27 04:00:00, 2017-06-28 05:00:00, 2017-06-29 04:00...
    ## $ apparentTemperatureMax     <dbl> 72.90, 72.36, 72.97, 75.47, 85.58, 77.90, 80.81, 80.74
    ## $ apparentTemperatureMaxTime <dttm> 2017-06-26 15:00:00, 2017-06-27 13:00:00, 2017-06-28 16:00:00, 2017-06-29 14:00...
    ## $ dewPoint                   <dbl> 52.64, 56.03, 52.71, 55.92, 67.49, 65.27, 64.99, 60.06
    ## $ humidity                   <dbl> 0.61, 0.72, 0.66, 0.66, 0.81, 0.82, 0.81, 0.67
    ## $ windSpeed                  <dbl> 5.73, 5.02, 5.31, 6.72, 8.37, 4.47, 0.80, 6.43
    ## $ windGust                   <dbl> 14.02, 10.02, 11.31, 17.32, 25.27, 12.49, 10.67, 17.14
    ## $ windBearing                <int> 265, 218, 280, 206, 229, 157, 216, 280
    ## $ visibility                 <int> 10, 10, 10, NA, NA, NA, NA, NA
    ## $ cloudCover                 <dbl> 0.12, 0.43, 0.38, 0.82, 0.72, 0.73, 0.97, 0.45
    ## $ pressure                   <dbl> 1013.45, 1013.64, 1014.86, 1015.43, 1012.29, 1013.55, 1012.19, 1013.89
    ## $ ozone                      <dbl> 338.43, 353.98, 379.92, 336.95, 327.90, 304.87, 304.66, 324.44
    ## $ uvIndex                    <int> 9, 6, 8, 6, 8, 6, 6, 7
    ## $ uvIndexTime                <int> 1498496400, 1498586400, 1498669200, 1498755600, 1498842000, 1498928400, 14990148...
    ## 
    ## currently 
    ## ======================================================================================================================== 
    ## Observations: 1
    ## Variables: 19
    ## $ time                 <dttm> 2017-06-26 12:08:43
    ## $ summary              <chr> "Clear"
    ## $ icon                 <chr> "clear-day"
    ## $ nearestStormDistance <int> 109
    ## $ nearestStormBearing  <int> 273
    ## $ precipIntensity      <int> 0
    ## $ precipProbability    <int> 0
    ## $ temperature          <dbl> 71.99
    ## $ apparentTemperature  <dbl> 69.45
    ## $ dewPoint             <dbl> 51.53
    ## $ humidity             <dbl> 0.49
    ## $ windSpeed            <dbl> 7.56
    ## $ windGust             <dbl> 16.95
    ## $ windBearing          <int> 290
    ## $ visibility           <int> 10
    ## $ cloudCover           <dbl> 0.02
    ## $ pressure             <dbl> 1014.01
    ## $ ozone                <int> 343
    ## $ uvIndex              <int> 9

``` r
then <- get_forecast_for(43.2672, -70.8617, "2013-05-06T12:00:00-0400", add_headers=TRUE)
print(then)
```

    ## hourly 
    ## ======================================================================================================================== 
    ## Observations: 24
    ## Variables: 15
    ## $ time                <dttm> 2013-05-06 00:00:00, 2013-05-06 01:00:00, 2013-05-06 02:00:00, 2013-05-06 03:00:00, 20...
    ## $ summary             <chr> "Clear", "Clear", "Clear", "Clear", "Clear", "Clear", "Clear", "Clear", "Clear", "Clear...
    ## $ icon                <chr> "clear-night", "clear-night", "clear-night", "clear-night", "clear-night", "clear-night...
    ## $ precipIntensity     <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    ## $ precipProbability   <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    ## $ temperature         <dbl> 40.32, 38.78, 37.63, 36.15, 34.39, 34.30, 34.66, 40.15, 44.32, 48.06, 51.39, 54.85, 58....
    ## $ apparentTemperature <dbl> 36.70, 35.53, 34.27, 33.24, 30.73, 30.32, 31.19, 37.27, 40.80, 44.38, 47.85, 51.47, 54....
    ## $ dewPoint            <dbl> 36.46, 35.62, 35.23, 34.17, 32.67, 32.92, 33.14, 37.95, 40.08, 42.35, 43.49, 42.36, 41....
    ## $ humidity            <dbl> 0.86, 0.88, 0.91, 0.92, 0.93, 0.95, 0.94, 0.92, 0.85, 0.81, 0.74, 0.63, 0.55, 0.53, 0.5...
    ## $ windSpeed           <dbl> 3.28, 2.31, 2.36, 1.19, 2.20, 2.86, 1.95, 2.16, 4.16, 5.30, 5.56, 5.23, 5.58, 7.81, 8.0...
    ## $ windBearing         <int> 163, 174, 167, 110, 75, 113, 59, 127, 163, 188, 188, 182, 213, 229, 232, 212, 216, 226,...
    ## $ visibility          <dbl> 9.36, 8.18, 8.49, 7.98, 6.89, 6.71, 6.08, 7.56, 7.89, 9.28, 9.47, 9.47, 9.47, 9.47, 9.4...
    ## $ cloudCover          <dbl> 0.00, 0.00, 0.00, 0.00, 0.00, 0.02, 0.03, 0.20, 0.23, 0.02, 0.05, 0.04, 0.04, 0.04, 0.0...
    ## $ pressure            <dbl> 1024.89, 1024.71, 1024.49, 1024.23, 1023.94, 1024.06, 1024.33, 1024.87, 1025.07, 1025.3...
    ## $ uvIndex             <int> 0, 0, 0, 0, 0, 0, 0, 1, 1, 3, 4, 7, 8, 9, 7, 5, 3, 2, 1, 0, 0, 0, 0, 0
    ## 
    ## daily 
    ## ======================================================================================================================== 
    ## Observations: 1
    ## Variables: 26
    ## $ time                       <dttm> 2013-05-06
    ## $ summary                    <chr> "Foggy overnight."
    ## $ icon                       <chr> "fog"
    ## $ sunriseTime                <dttm> 2013-05-06 05:30:54
    ## $ sunsetTime                 <dttm> 2013-05-06 19:51:43
    ## $ moonPhase                  <dbl> 0.9
    ## $ precipIntensity            <int> 0
    ## $ precipIntensityMax         <int> 0
    ## $ precipProbability          <int> 0
    ## $ temperatureMin             <dbl> 34.3
    ## $ temperatureMinTime         <dttm> 2013-05-06 05:00:00
    ## $ temperatureMax             <dbl> 60.29
    ## $ temperatureMaxTime         <dttm> 2013-05-06 14:00:00
    ## $ apparentTemperatureMin     <dbl> 30.32
    ## $ apparentTemperatureMinTime <dttm> 2013-05-06 05:00:00
    ## $ apparentTemperatureMax     <dbl> 55.56
    ## $ apparentTemperatureMaxTime <dttm> 2013-05-06 14:00:00
    ## $ dewPoint                   <dbl> 40.2
    ## $ humidity                   <dbl> 0.78
    ## $ windSpeed                  <dbl> 4.01
    ## $ windBearing                <int> 199
    ## $ visibility                 <dbl> 7.8
    ## $ cloudCover                 <dbl> 0.05
    ## $ pressure                   <dbl> 1023.47
    ## $ uvIndex                    <int> 9
    ## $ uvIndexTime                <int> 1367859600
    ## 
    ## currently 
    ## ======================================================================================================================== 
    ## Observations: 1
    ## Variables: 15
    ## $ time                <dttm> 2013-05-06 12:00:00
    ## $ summary             <chr> "Clear"
    ## $ icon                <chr> "clear-day"
    ## $ precipIntensity     <int> 0
    ## $ precipProbability   <int> 0
    ## $ temperature         <dbl> 58.15
    ## $ apparentTemperature <dbl> 54.66
    ## $ dewPoint            <dbl> 41.86
    ## $ humidity            <dbl> 0.55
    ## $ windSpeed           <dbl> 5.58
    ## $ windBearing         <int> 213
    ## $ visibility          <dbl> 9.47
    ## $ cloudCover          <dbl> 0.04
    ## $ pressure            <dbl> 1024.31
    ## $ uvIndex             <int> 8

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
    ## Observations: 24
    ## Variables: 14
    ## $ time                <dttm> 2013-05-06 12:00:00, 2013-05-06 13:00:00, 2013-05-06 14:00:00, 2013-05-06 15:00:00, 20...
    ## $ summary             <chr> "Mostly Cloudy", "Partly Cloudy", "Partly Cloudy", "Partly Cloudy", "Mostly Cloudy", "M...
    ## $ icon                <chr> "partly-cloudy-night", "partly-cloudy-night", "partly-cloudy-night", "partly-cloudy-nig...
    ## $ precipType          <chr> "rain", "rain", "rain", "rain", "rain", "rain", "rain", "rain", "rain", "rain", "rain",...
    ## $ temperature         <dbl> 57.35, 55.78, 54.52, 53.33, 52.43, 52.86, 55.25, 58.97, 63.02, 67.49, 72.29, 76.25, 78....
    ## $ apparentTemperature <dbl> 54.18, 52.36, 50.90, 49.76, 48.98, 49.33, 51.24, 54.22, 57.74, 62.09, 66.94, 70.95, 73....
    ## $ dewPoint            <dbl> 36.96, 37.89, 38.45, 38.50, 38.36, 38.38, 38.42, 38.10, 37.66, 37.57, 37.32, 36.72, 36....
    ## $ humidity            <dbl> 0.46, 0.51, 0.54, 0.57, 0.59, 0.58, 0.53, 0.46, 0.39, 0.33, 0.28, 0.24, 0.22, 0.21, 0.2...
    ## $ windSpeed           <dbl> 3.84, 4.39, 4.78, 4.61, 4.28, 4.45, 5.59, 7.20, 8.45, 8.99, 9.21, 9.30, 9.37, 9.46, 9.3...
    ## $ windBearing         <int> 178, 184, 186, 184, 179, 174, 172, 171, 170, 167, 163, 162, 168, 176, 180, 176, 166, 15...
    ## $ visibility          <dbl> 9.65, 9.42, 9.25, 9.21, 9.23, 9.25, 9.24, 9.23, 9.25, 9.30, 9.37, 9.43, 9.45, 9.45, 9.4...
    ## $ cloudCover          <dbl> 0.62, 0.41, 0.29, 0.40, 0.61, 0.75, 0.73, 0.63, 0.56, 0.58, 0.62, 0.66, 0.70, 0.73, 0.7...
    ## $ pressure            <dbl> 1013.52, 1013.49, 1013.39, 1013.14, 1012.82, 1012.56, 1012.55, 1012.60, 1012.37, 1011.6...
    ## $ uvIndex             <int> 0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 5, 5, 3, 2, 1, 1, 0, 0, 0, 0, 0, 0
    ## 
    ## daily 
    ## ======================================================================================================================== 
    ## Observations: 1
    ## Variables: 24
    ## $ time                       <dttm> 2013-05-06 12:00:00
    ## $ summary                    <chr> "Mostly cloudy throughout the day."
    ## $ icon                       <chr> "partly-cloudy-day"
    ## $ sunriseTime                <dttm> 2013-05-06 16:25:51
    ## $ sunsetTime                 <dttm> 2013-05-07 07:11:10
    ## $ moonPhase                  <dbl> 0.91
    ## $ precipType                 <chr> "rain"
    ## $ temperatureMin             <dbl> 52.43
    ## $ temperatureMinTime         <dttm> 2013-05-06 16:00:00
    ## $ temperatureMax             <dbl> 84.52
    ## $ temperatureMaxTime         <dttm> 2013-05-07 04:00:00
    ## $ apparentTemperatureMin     <dbl> 48.98
    ## $ apparentTemperatureMinTime <dttm> 2013-05-06 16:00:00
    ## $ apparentTemperatureMax     <dbl> 80.6
    ## $ apparentTemperatureMaxTime <dttm> 2013-05-07 05:00:00
    ## $ dewPoint                   <dbl> 37.33
    ## $ humidity                   <dbl> 0.35
    ## $ windSpeed                  <dbl> 6.5
    ## $ windBearing                <int> 168
    ## $ visibility                 <dbl> 9.36
    ## $ cloudCover                 <dbl> 0.62
    ## $ pressure                   <dbl> 1008.89
    ## $ uvIndex                    <int> 5
    ## $ uvIndexTime                <int> 1367902800
    ## 
    ## currently 
    ## ======================================================================================================================== 
    ## Observations: 1
    ## Variables: 14
    ## $ time                <dttm> 2013-05-06 12:00:00
    ## $ summary             <chr> "Mostly Cloudy"
    ## $ icon                <chr> "partly-cloudy-night"
    ## $ precipType          <chr> "rain"
    ## $ temperature         <dbl> 57.35
    ## $ apparentTemperature <dbl> 54.18
    ## $ dewPoint            <dbl> 36.96
    ## $ humidity            <dbl> 0.46
    ## $ windSpeed           <dbl> 3.84
    ## $ windBearing         <int> 178
    ## $ visibility          <dbl> 9.65
    ## $ cloudCover          <dbl> 0.62
    ## $ pressure            <dbl> 1013.52
    ## $ uvIndex             <int> 0

``` r
bigger_list$Maine
```

    ## hourly 
    ## ======================================================================================================================== 
    ## Observations: 24
    ## Variables: 14
    ## $ time                <dttm> 2013-05-05 14:00:00, 2013-05-05 15:00:00, 2013-05-05 16:00:00, 2013-05-05 17:00:00, 20...
    ## $ summary             <chr> "Clear", "Clear", "Clear", "Clear", "Clear", "Clear", "Clear", "Clear", "Clear", "Clear...
    ## $ icon                <chr> "clear-night", "clear-night", "clear-night", "clear-night", "clear-night", "clear-night...
    ## $ precipType          <chr> "rain", "rain", "rain", "rain", "rain", "rain", "rain", "rain", "rain", "rain", "rain",...
    ## $ temperature         <dbl> 53.54, 52.38, 51.25, 49.29, 50.96, 50.25, 49.37, 55.50, 61.63, 60.60, 67.21, 72.04, 69....
    ## $ apparentTemperature <dbl> 49.72, 49.22, 43.43, 46.90, 48.58, 47.11, 46.86, 52.70, 54.32, 58.41, 62.31, 65.33, 64....
    ## $ dewPoint            <dbl> 36.71, 36.48, 40.43, 37.64, 38.04, 38.24, 36.74, 41.43, 41.26, 39.05, 41.98, 33.27, 39....
    ## $ humidity            <dbl> 0.53, 0.55, 0.66, 0.64, 0.61, 0.63, 0.62, 0.59, 0.47, 0.45, 0.40, 0.24, 0.33, 0.21, 0.2...
    ## $ windSpeed           <dbl> 4.72, 3.32, 13.00, 1.86, 2.05, 3.49, 1.91, 3.97, 13.00, 2.65, 9.00, 11.02, 8.93, 15.61,...
    ## $ windBearing         <int> 311, 312, 290, 264, 259, 226, 227, 183, 300, 309, 280, 315, 312, 304, 308, 307, 306, 30...
    ## $ visibility          <dbl> 7.62, 6.20, 6.20, 7.62, 6.20, 6.20, 9.15, 6.20, 6.20, 9.15, 6.20, 6.20, 8.80, 6.20, 6.2...
    ## $ cloudCover          <dbl> 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.15, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.0...
    ## $ pressure            <dbl> 1020.43, NA, NA, 1020.20, NA, NA, 1019.94, NA, NA, 1018.77, NA, NA, 1017.31, NA, NA, 10...
    ## $ uvIndex             <int> 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 6, 8, 9, 9, 6, 4, 2, 1, 1, 0, 0, 0, 0
    ## 
    ## daily 
    ## ======================================================================================================================== 
    ## Observations: 1
    ## Variables: 24
    ## $ time                       <dttm> 2013-05-05 14:00:00
    ## $ summary                    <chr> "Clear throughout the day."
    ## $ icon                       <chr> "clear-day"
    ## $ sunriseTime                <dttm> 2013-05-05 20:04:31
    ## $ sunsetTime                 <dttm> 2013-05-06 10:24:22
    ## $ moonPhase                  <dbl> 0.88
    ## $ precipType                 <chr> "rain"
    ## $ temperatureMin             <dbl> 49.29
    ## $ temperatureMinTime         <dttm> 2013-05-05 17:00:00
    ## $ temperatureMax             <dbl> 75.33
    ## $ temperatureMaxTime         <dttm> 2013-05-06 06:00:00
    ## $ apparentTemperatureMin     <dbl> 43.43
    ## $ apparentTemperatureMinTime <dttm> 2013-05-05 16:00:00
    ## $ apparentTemperatureMax     <dbl> 66.44
    ## $ apparentTemperatureMaxTime <dttm> 2013-05-06 05:00:00
    ## $ dewPoint                   <dbl> 37.58
    ## $ humidity                   <dbl> 0.42
    ## $ windSpeed                  <dbl> 8.31
    ## $ windBearing                <int> 298
    ## $ visibility                 <dbl> 7.02
    ## $ cloudCover                 <dbl> 0.02
    ## $ pressure                   <dbl> 1017.78
    ## $ uvIndex                    <int> 9
    ## $ uvIndexTime                <int> 1367827200
    ## 
    ## currently 
    ## ======================================================================================================================== 
    ## Observations: 1
    ## Variables: 13
    ## $ time                <dttm> 2013-05-06 12:00:00
    ## $ summary             <chr> "Clear"
    ## $ icon                <chr> "clear-night"
    ## $ precipType          <chr> "rain"
    ## $ temperature         <dbl> 67.17
    ## $ apparentTemperature <dbl> 60.15
    ## $ dewPoint            <dbl> 33.18
    ## $ humidity            <dbl> 0.28
    ## $ windSpeed           <dbl> 11.22
    ## $ windBearing         <int> 288
    ## $ visibility          <dbl> 6.2
    ## $ cloudCover          <int> 0
    ## $ uvIndex             <int> 0

``` r
print(sprintf("You have used %s API calls.", then$`x-forecast-api-calls`))
```

    ## [1] "You have used 10 API calls."

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

    ## [1] "Mon Jun 26 12:08:47 2017"

``` r
test_dir("tests/")
```

    ## testthat results ========================================================================================================
    ## OK: 4 SKIPPED: 0 FAILED: 0
    ## 
    ## DONE ===================================================================================================================
