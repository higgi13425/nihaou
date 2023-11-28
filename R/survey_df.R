#' fake_survey_df
#'
#' dataframe of fake survey data (generated in data-raw) to
#' enable testing of functions for survey data.
#'
#'
#' @format A data frame with three variables:
#' \describe{
#' \item{\code{person_id}}{numeric id, 1001-1010}
#' \item{\code{question_concept_id}}{one of the actual 81 survey question concept ids for the 81 questions in the Social Determinants of Health Survey}
#' \item{\code{answer}}{one of the possible answers, randomly chosen, for this question_concept_id}
#' }
#'
#' For further details on the SDOH survey for NIH AllOfUs, see \url{https://www.researchallofus.org/data-tools/survey-explorer/social-determinants-survey/}
#'
"fake_survey_df"
