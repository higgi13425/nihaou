test_that("calculation of spa score in fake data works", {
  expect_equal(calc_spa(survey_df), c(4,3,5,2,6,4,7,2,4,5))
})
