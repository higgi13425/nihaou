# creates an ordinal categorical indicating the frequency of attending religious meetings or services

calc_religious_attendance <- function(survey_df) {
  if (!is.null(survey_df)){
    df_religious_attendance  <-  survey_df |>
      dplyr::filter(question_concept_id == 40192470) |> #specific Q
      # 40192470 = How often do you go to religious meetings or services?
      dplyr::select(person_id, question_concept_id, answer) |>
      dplyr::filter(answer != "PMI: Skip") |> # remove skipped Q
      dplyr::mutate(religious_attendance = answer) |>
      dplyr::select(person_id, religious_attendance) |> # only 2 columns in the final result
      dplyr::distinct(person_id, .keep_all = TRUE) |> # remove duplicate rows
      dplyr::right_join(survey_df |> # include participants without scores as NA
                          dplyr::group_by(person_id) |>
                          dplyr::summarize(),
                        by = 'person_id')
  }
  df_religious_attendance
}