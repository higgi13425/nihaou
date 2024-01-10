library(dplyr)
test_that("calculation of density score in fake data works", {
  expect_equal(calc_density(fake_survey_df) |> pull(density), c("High","High","High","High","High","High","High","High","High","High"))
})
