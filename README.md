
<!-- README.md is generated from README.Rmd. Please edit that file -->

# nihaou

<!-- badges: start -->
<!-- badges: end -->

The goal of nihaou is to provide functions to calculate Social
Determinants of Health summary scores for the NIH All of Us Research
Program from individual survey responses.

# nihaou <a href="https://higgi13425.github.io/nihaou/"><img src="man/figures/logo.png" align="right" height="137" alt="nihaou website" /></a>

## Installation

You can install the development version of nihaou from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("higgi13425/nihaou")
```

## Example

This is a basic example which shows you how to solve a common problem,
calculating the neighborhood disorder score for a survey data frame:

``` r
library(nihaou)
## basic example code
calc_disorder(fake_survey_df)
#> # A tibble: 10 × 2
#>    person_id disorder
#>        <dbl>    <dbl>
#>  1      1001     3.08
#>  2      1002     2.54
#>  3      1003     2.15
#>  4      1004     1.92
#>  5      1005     2.69
#>  6      1006     2.31
#>  7      1007     2.08
#>  8      1008     2.23
#>  9      1009     2.62
#> 10      1010     2.31
```

# Usage

With a survey data frame from the NIH AllofUs Research Program, you can
calculate the Social Determinants of Health summary scores within your
workspace with the following functions:

- calc_cohesion()
- calc_density()
- calc_disorder()
- calc_spa()

There are only 4 functions built so far, and each of them has one
working test. To be able to calculate all of the scores, we will need
another 24 functions or so.
