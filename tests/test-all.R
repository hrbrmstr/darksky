library(testthat)

if (identical(tolower(Sys.getenv("NOT_CRAN")), "true")) {
  library(darksky)
  test_check("darksky")
}
