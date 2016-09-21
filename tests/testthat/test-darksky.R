context("basic functionality")
test_that("the API call works", {

  current <- get_current_forecast(43.2672, -70.8617)

  expect_that(current, is_a("darksky"))
  expect_that("time" %in% colnames(current$hourly), equals(TRUE))

  earlier <- get_forecast_for(43.2672, -70.8617, "2013-05-06T12:00:00-0400")

  expect_that(earlier, is_a("darksky"))
  expect_that("time" %in% colnames(earlier$daily), equals(TRUE))

})


