library(dplyr)
test_that("calculation of spa score in fake data works", {
  expect_equal(calc_spa(fake_survey_df) |> pull(spa), c(18,20,11,24,17,18,18,11,22))
})
