#' Calculate neighborhood cohesion score
#'
#' @param survey_df - the survey dataframe including SDOH
#'
#' @return df_cohesion - a dataframe with person_id and cohesion score
#' @export
#'
#' @examples
calc_cohesion <- function(survey_df) {
  if (!is.null(survey_df)){
    df_cohesion  <-  survey_df |>
      dplyr::filter(question_concept_id %in% c( 40192463, 40192411, 40192499, 40192417)) |> #specific
      dplyr::select(person_id, question_concept_id, answer) |>
      dplyr::mutate(value = dplyr::case_when(
            answer == "Strongly agree" ~ 5,
            answer == "Agree" ~ 4,
            answer == "Neutral (neither agree nor disagree)" ~ 3,
            answer == "Disagree" ~ 2,
            answer == "Strongly disagree" ~ 1,
            TRUE ~ 999)) |>
      dplyr::filter(value != 999) |>
      dplyr::group_by(person_id) |>
      dplyr::mutate(cohesion = round(mean(value,
          na.rm = TRUE), 2), # rounded to 2 decimals
             nrows = length(value)) |>
      dplyr::filter(nrows == 4) |>
      dplyr::select(person_id, cohesion) |>
      dplyr::ungroup() # remember to ungroup
  }
  df_cohesion
}
