library(dplyr)
test_that("calculation of cohesion score in fake data works", {
  expect_equal(calc_cohesion(fake_survey_df) |> pull(cohesion), c(3.75,3.5,3.25,2.75,3.25,3.5,1.75,2.25,4.25,1.75))
})

