library(dplyr)
test_that("calculation of density score in fake data works", {
  expect_equal(calc_density(fake_survey_df) |> pull(density), c("High","High","Low","High","High","High","High","Low","High","High"))
})
