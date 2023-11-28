library(dplyr)
test_that("calculation of disorder score in fake data works", {
  expect_equal(calc_disorder(fake_survey_df) |> pull(disorder), c(3.08,2.54,2.15,1.92,2.69,2.31,2.08,2.23,2.62,2.31))
})
