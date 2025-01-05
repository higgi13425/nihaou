# Emotional Subscale
# creates a numeric score with range 0-100
# mean of individual item scores transformed to a 0-100 scale
# higher scores indicate more emotional support

calc_emo_support <- function(survey_df) {
  if (!is.null(survey_df)){
    df_emo_support  <-  survey_df |>
      dplyr::filter(question_concept_id %in% c(40192399, 40192439, 40192446, 40192528)) |> #specific 4 Qs
      # 40192399 = How often do you have someone who understands your problems?
      # 40192439 = How often do you have someone to have a good time with?
      # 40192446 = How often do you have someone to love and make you feel wanted?
      # 40192528 = How often do you have someone to turn to for suggestions about how to deal with a personal problem?
      dplyr::select(person_id, question_concept_id, answer_concept_id) |>
      dplyr::mutate(value = dplyr::case_when(
        answer_concept_id == 40192454 ~ 1, # None of the time
        answer_concept_id == 40192518 ~ 2, # A little of the time
        answer_concept_id == 40192486 ~ 3, # Some of the time
        answer_concept_id == 40192382 ~ 4, # Most of the time
        answer_concept_id == 40192521 ~ 5, # All of the time
        TRUE ~ 999)) |>
      dplyr::filter(value != 999) |> # remove skipped Q
      dplyr::group_by(person_id) |>
      dplyr::mutate(emo_support = round(100*(sum(value, na.rm = TRUE)-4)/(20-4), 
                                        2), # rounded to 2 decimals
                    nrows = length(value)) |> # did they answer all 4 Q?
      dplyr::filter(nrows == 4) |> # include if answered 4
      dplyr::select(person_id, emo_support) |> # only 2 columns in the final result
      dplyr::distinct(person_id, .keep_all = TRUE) |> # remove duplicate rows
      dplyr::right_join(survey_df |> # include participants without scores as NA
                          dplyr::group_by(person_id) |>
                          dplyr::summarize(),
                        by = 'person_id') |>
      dplyr::ungroup() # remember to ungroup
  }
  df_emo_support
}