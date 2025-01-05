# creates a numeric score with range 8-32
# sum of individual item scores
# higher scores indicate higher degree of loneliness

calc_loneliness <- function(survey_df) {
  if (!is.null(survey_df)){
    df_loneliness  <-  survey_df |>
      dplyr::filter(question_concept_id %in% c(40192390, 40192397, 40192398, 40192494, 40192501, 40192504, 40192507, 40192516)) |> #specific 8 Qs
      # 40192390 = How often do you feel that you are unhappy being so withdrawn?
      # 40192397 = How often do you feel that there is no one you can turn to?
      # 40192398 = How often do you feel left out?
      # 40192494 = How often do you feel that people are around you but not with you?
      # 40192501 = How often do you feel isolated from others?
      # 40192504 = How often do you feel that you are an outgoing person?
      # 40192507 = How often do you feel lack companionship?
      # 40192516 = How often do you fell that you can find companionship when you want it?
      dplyr::select(person_id, question_concept_id, answer_concept_id) |>
      dplyr::mutate(value = dplyr::case_when(
        answer_concept_id == 40192465 ~ 1, # Never
        answer_concept_id == 40192481 ~ 2, # Rarely
        answer_concept_id == 40192429 ~ 3, # Sometimes
        answer_concept_id == 40192482 ~ 4, # Often
        TRUE ~ 999)) |>
      dplyr::filter(value != 999) |> # remove skipped Q
      dplyr::mutate(value = dplyr::case_when(
        # reverse code 4 Qs
        question_concept_id == 40192504 ~ 5 - value, # 4 -> 1, 3 -> 2 etc
        question_concept_id == 40192516 ~ 5 - value,
        TRUE ~ value)) |>
      dplyr::group_by(person_id) |>
      dplyr::mutate(loneliness = sum(value,
                                     na.rm = TRUE),
                    nrows = length(value)) |> # did they answer all 8 Q?
      dplyr::filter(nrows == 8) |> # include if answered 8
      dplyr::select(person_id, loneliness) |> # only 2 columns in the final result
      dplyr::distinct(person_id, .keep_all = TRUE) |> # remove duplicate rows
      dplyr::right_join(survey_df |> # include participants without scores as NA
                          dplyr::group_by(person_id) |>
                          dplyr::summarize(),
                        by = 'person_id') |>
      dplyr::ungroup() # remember to ungroup
  }
  df_loneliness
}