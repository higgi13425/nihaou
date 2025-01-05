# Instrumental Subscale
# creates a numeric score with range 0-100
# mean of individual item scores transformed to a 0-100 scale
# higher scores indicate more tangible support

calc_ins_support <- function(survey_df) {
  if (!is.null(survey_df)){
    df_ins_support  <-  survey_df |>
      dplyr::filter(question_concept_id %in% c(40192388, 40192442, 40192480, 40192511)) |> #specific 4 Qs
      # 40192388 = How often do you have someone to prepare your meals if you were unable to do it yourself?
      # 40192442 = How often do you have someone to help you if you were confined to bed?
      # 40192480 = How often do you have someone to take you to the doctor if you need it?
      # 40192511 = How often do you have someone to help you with daily chores if you were sick?
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
      dplyr::mutate(ins_support = round(100*(sum(value, na.rm = TRUE)-4)/(20-4),
                                        2), # rounded to 2 decimals
                    nrows = length(value)) |> # did they answer all 4 Q?
      dplyr::filter(nrows == 4) |> # include if answered 4
      dplyr::select(person_id, ins_support) |> # only 2 columns in the final result
      dplyr::distinct(person_id, .keep_all = TRUE) |> # remove duplicate rows
      dplyr::right_join(survey_df |> # include participants without scores as NA
                          dplyr::group_by(person_id) |>
                          dplyr::summarize(),
                        by = 'person_id') |>
      dplyr::ungroup() # remember to ungroup
  }
  df_ins_support
}