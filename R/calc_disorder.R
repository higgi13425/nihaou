#' @title Calculate neighborhood disorder score
#'
#' @param survey_df - a survey dataframe including SDOH
#'
#' @return df_disorder - a dataframe with person_id and disorder score
#' @export
#' @examples
#' calc_disorder(survey_df)
#'
calc_disorder <- function(survey_df) {
  if (!is.null(survey_df)){
    df_disorder  <-  survey_df |>
      dplyr::filter(question_concept_id %in% c( 40192420, 40192522, 40192412, 40192469, 40192456, 40192386, 40192500, 40192493, 40192457, 40192476, 40192404, 40192400, 40192384)) |> #specific 13 Qs
      dplyr::select(person_id, question_concept_id, answer) |>
      dplyr::mutate(value = dplyr::case_when(
        answer == "Strongly agree" ~ 4,
        answer == "Agree" ~ 3,
        answer == "Disagree" ~ 2,
        answer == "Strongly disagree" ~ 1,
        TRUE ~ 999)) |>
      dplyr::filter(value != 999) |> # remove skipped Q
      dplyr::mutate(value = dplyr::case_when(
        # reverse code 4 Qs
        question_concept_id == 40192456 ~ 5 - value,
        question_concept_id == 40192386 ~ 5 - value,
        question_concept_id == 40192400 ~ 5 - value,           question_concept_id == 40192384 ~ 5 - value,
        TRUE ~ value)) |>
      dplyr::group_by(person_id) |>
      dplyr::mutate(disorder = round(mean(value,
                                   na.rm = TRUE), 2), # rounded to 2 decimals
             nrows = length(value)) |> # did they answer all 13 Q?
      dplyr::filter(nrows == 13) |> # kick out if not 13
      dplyr::select(person_id, disorder) |>
      dplyr::ungroup() # remember to ungroup
  }
  df_disorder
}

