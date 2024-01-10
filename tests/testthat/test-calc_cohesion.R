library(dplyr)
test_that("calculation of cohesion score in fake data works", {
  expect_equal(calc_cohesion(fake_survey_df) |> pull(cohesion), c(5,4,2,1.5,2.5,3,1.75,1.75,4,2))
})

