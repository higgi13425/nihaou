# creates a numeric score with range 6-36
# sum of individual item scores
# higher scores indicate more daily religious or spiritual experiences

calc_spirit <- function(survey_df) {
  if (!is.null(survey_df)){
    df_spirit  <-  survey_df |>
      dplyr::filter(question_concept_id %in% c(40192401, 40192415, 40192443, 40192471, 40192475, 40192498)) |> #specific 6 Qs
      # 40192401 = How often do you feel deep inner peace or harmony?
      # 40192415 = How often do you feel that you are spiritually touched by the beauty of creation?
      # 40192443 = How often do you desire to be closer to or in union with God (or a higher power)?
      # 40192471 = How often do you feel God's (or a higher power's) love for you, directly or through others?
      # 40192475 = How often do you find strength and comfort in your religion?
      # 40192498 = How often do you feel God's (or a higher power's) presence?
      dplyr::select(person_id, question_concept_id, answer_concept_id) |>
      dplyr::mutate(value = dplyr::case_when(
        answer_concept_id == 40192487 ~ 1, # I do not believe in God (or a higher power)
        answer_concept_id == 40192432 ~ 1, # I am not religious
        answer_concept_id == 40192509 ~ 1, # Never or almost never
        answer_concept_id == 40192459 ~ 2, # Once in a while
        answer_concept_id == 40192513 ~ 3, # Some days
        answer_concept_id == 40192484 ~ 4, # Most days
        answer_concept_id == 40192385 ~ 5, # Every day
        answer_concept_id == 40192403 ~ 6, # Many times a day
        TRUE ~ 999)) |>
      dplyr::filter(value != 999) |> # remove skipped Q
      dplyr::group_by(person_id) |>
      dplyr::mutate(spirit = sum(value,
                                 na.rm = TRUE),
                    nrows = length(value)) |> # did they answer all 6 Q?
      dplyr::filter(nrows == 6) |> # include if answered 6
      dplyr::select(person_id, spirit) |> # only 2 columns in the final result
      dplyr::distinct(person_id, .keep_all = TRUE) |> # remove duplicate rows
      dplyr::right_join(survey_df |> # include participants without scores as NA
                          dplyr::group_by(person_id) |>
                          dplyr::summarize(),
                        by = 'person_id') |>
      dplyr::ungroup() # remember to ungroup
  }
  df_spirit
}