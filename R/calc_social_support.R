# Overall Social Support
# creates a numeric score with range 0-100
# mean of individual item scores transformed to a 0-100 scale
# higher scores indicate more social support

calc_social_support <- function(survey_df) {
  if (!is.null(survey_df)){
    df_social_support  <-  survey_df |>
      dplyr::filter(question_concept_id %in% c(40192388, 40192399, 40192439, 40192442, 40192446, 40192480, 40192511, 40192528)) |> #specific 8 Qs
      # 40192388 = How often do you have someone to prepare your meals if you were unable to do it yourself?
      # 40192399 = How often do you have someone who understands your problems?
      # 40192439 = How often do you have someone to have a good time with?
      # 40192442 = How often do you have someone to help you if you were confined to bed?
      # 40192446 = How often do you have someone to love and make you feel wanted?
      # 40192480 = How often do you have someone to take you to the doctor if you need it?
      # 40192511 = How often do you have someone to help you with daily chores if you were sick?
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
      dplyr::mutate(social_support = round(100*(sum(value, na.rm = TRUE)-8)/(40-8),
                                           2), # rounded to 2 decimals
                    nrows = length(value)) |> # did they answer all 8 Q?
      dplyr::filter(nrows == 8) |> # include if answered 8
      dplyr::select(person_id, social_support) |> # only 2 columns in the final result
      dplyr::distinct(person_id, .keep_all = TRUE) |> # remove duplicate rows
      dplyr::right_join(survey_df |> # include participants without scores as NA
                          dplyr::group_by(person_id) |>
                          dplyr::summarize(),
                        by = 'person_id') |>
      dplyr::ungroup() # remember to ungroup
  }
  df_social_support
}