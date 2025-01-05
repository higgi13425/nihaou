# Number of Moves
# creates a numeric variable representing the number of moves in the past year

calc_num_moves <- function(survey_df) {
  if (!is.null(survey_df)){
    df_num_moves  <-  survey_df |>
      dplyr::filter(question_concept_id == 40192441) |> #specific Q
      # 40192441 = In the last 12 months, how many times have you or your family moved from one home to another? Number of moves in past 12 months:
      dplyr::select(person_id, question_concept_id, answer) |>
      dplyr::filter(answer != "PMI: Skip") |> # remove skipped Q
      dplyr::mutate(num_moves = as.numeric(answer)) |>
      dplyr::select(person_id, num_moves) |> # only 2 columns in the final result
      dplyr::right_join(survey_df |> # include participants without scores as NA
                          dplyr::group_by(person_id) |>
                          dplyr::summarize(),
                        by = 'person_id')
  }
  df_num_moves
}