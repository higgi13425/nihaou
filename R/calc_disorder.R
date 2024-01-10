#' @title Calculate neighborhood disorder score
#'
#' @param survey_df - a survey dataframe including SDOH
#'
#' @return df_disorder - a dataframe with person_id and disorder score
#' @export
#' @examples
#' calc_disorder(fake_survey_df)
#'
calc_disorder <- function(survey_df) {
  if (!is.null(survey_df)){
    df_disorder  <-  survey_df |>
      dplyr::filter(question_concept_id %in% c(40192420, 40192522, 40192412, 40192469, 40192456, 40192386, 40192500, 40192493, 40192457, 40192476, 40192404, 40192400, 40192384)) |> #specific 13 Qs
      # 40192420 = How much you agree or disagree that there is a lot of graffiti in your neighborhood?
      # 40192522 = How much you agree or disagree that your neighborhood is noisy?
      # 40192412 = How much you agree or disagree that vandalism is common in your neighborhood?
      # # 40192469 = How much you agree or disagree that there are lot of abandoned buildings in your neighborhood?
      # 40192456 = How much you agree or disagree that your neighborhood is clean?
      # 40192386 = How much you agree or disagree that people in your neighborhood take good care of their houses and apartments?
      # 40192500 = How much you agree or disagree that there are too many people hanging around on the streets near your home?
      # 40192493 = How much you agree or disagree that there is a lot of crime in your neighborhood?
      # 40192457 = How much you agree or disagree that there is too much drug use in your neighborhood?
      # 40192476 = How much you agree or disagree that there is too much alcohol use in your neighborhood?
      # 40192404 = How much you agree or disagree that you are always having trouble with your neighbors?
    # 40192400 = How much you agree or disagree that in your neighborhood people watch out for each other?
    # 40192384 = How much you agree or disagree that your neighborhood is safe?
    dplyr::select(person_id, question_concept_id, answer_concept_id) |>
      dplyr::mutate(value = dplyr::case_when(
        answer_concept_id == 40192514 ~ 4, # Strongly agree
        answer_concept_id == 40192455 ~ 3, # Agree
        answer_concept_id == 40192408 ~ 2, # Disagree
        answer_concept_id == 40192422 ~ 1, # Strongly disagree
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
      dplyr::distinct(person_id, .keep_all = TRUE) |>
      dplyr::right_join(survey_df |> # include participants without scores as NA
                          dplyr::group_by(person_id) |>
                          dplyr::summarize(),
                        by = 'person_id') |>
      dplyr::ungroup() # remember to ungroup
  }
  df_disorder
}


