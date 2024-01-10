#' Calculate neighborhood cohesion score
#'
#' @param survey_df - the survey dataframe including SDOH
#'
#' @return df_cohesion - a dataframe with person_id and cohesion score
#' @export
#'
#' @examples
#' calc_cohesion(fake_survey_df)
#'
calc_cohesion <- calc_cohesion <- function(survey_df) {
  if (!is.null(survey_df)){
    df_cohesion  <-  survey_df |>
      dplyr::filter(question_concept_id %in% c( 40192463, 40192411, 40192499, 40192417)) |> #specific 4 Qs
      # 40192463 = How much you agree or disagree that people around here are willing to help their neighbor?
      # 40192411 = How much you agree or disagree that people in your neighborhood generally get along with each other?
      # 40192499 = How much you agree or disagree that people in your neighborhood can be trusted?
      # 40192417 = How much you agree or disagree that people in your neighborhood share the same values?
      dplyr::select(person_id, question_concept_id, answer_concept_id) |>
      dplyr::mutate(value = dplyr::case_when(
        answer_concept_id == 40192514 ~ 5, # Strongly agree
        answer_concept_id == 40192455 ~ 4, # Agree
        answer_concept_id == 40192524 ~ 3, # Neutral (neither agree nor disagree)
        answer_concept_id == 40192408 ~ 2, # Disagree
        answer_concept_id == 40192422 ~ 1, # Strongly disagree
        TRUE ~ 999)) |>
      dplyr::filter(value != 999) |>
      dplyr::group_by(person_id) |>
      dplyr::mutate(cohesion = round(mean(value,
                                          na.rm = TRUE), 2), # rounded to 2 decimals
                    nrows = length(value)) |>
      dplyr::filter(nrows == 4) |>
      dplyr::select(person_id, cohesion) |>
      dplyr::distinct(person_id, .keep_all = TRUE) |>
      dplyr::right_join(survey_df |> # include participants without scores as NA
                          dplyr::group_by(person_id) |>
                          dplyr::summarize(),
                        by = 'person_id') |>
      dplyr::ungroup() # remember to ungroup
  }
  df_cohesion
}

