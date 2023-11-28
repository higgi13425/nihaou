#' @title Calculate neighborhood PANES (Physical Activity Neighborhood Environment Scale) aka Support for Physical Activity (spa) score
#'
#' @param survey_df - a survey dataframe including SDOH
#'
#' @return df_spa - a dataframe with person_id and spa score that shows neighborhood support for physical activity
#' @export
#' @examples
#' calc_spa(fake_survey_df)
#'
calc_spa <- function(survey_df) {
  if (!is.null(survey_df)){
    df_spa  <-  survey_df |>
      dplyr::filter(question_concept_id %in% c(40192436, 40192440, 40192437, 40192431, 40192410, 40192492, 40192414)) |> #specific 7 Qs
      dplyr::select(person_id, question_concept_id, answer) |>
      dplyr::mutate(value = dplyr::case_when(
        answer == "Strongly agree" ~ 4,
        answer == "Somewhat agree" ~ 3,
        answer == "Somewhat disagree" ~ 2,
        answer == "Strongly disagree" ~ 1,
        TRUE ~ 999)) |>
      dplyr::filter(value != 999) |> # remove skipped Q
      dplyr::mutate(value = dplyr::case_when(
        # reverse code 2 Qs
        question_concept_id == 40192492 ~ 5 - value,
        question_concept_id == 40192414 ~ 5 - value,
        TRUE ~ value)) |>
      dplyr::group_by(person_id) |>
      dplyr::mutate(spa = sum(value,
           na.rm = TRUE),
            nrows = length(value)) |> # did they answer all 7 Q?
      dplyr::filter(nrows == 7) |> # kick out if not 7
      dplyr::distinct(person_id, .keep_all = TRUE) |>
      dplyr::ungroup()
    # remember to ungroup
  }
  df_spa
}


