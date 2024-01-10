library(dplyr)
test_that("calculation of spa score in fake data works", {
  expect_equal(calc_spa(fake_survey_df) |> pull(spa), c(22,13,NA,NA,NA,NA,NA,NA,NA,NA))
})
