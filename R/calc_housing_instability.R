# creates a binary categorical variable with value TRUE or FALSE
# TRUE denotes that the participant is endorsing a housing need, (i.e., selected at least one problem)

calc_housing_instability <- function(survey_df) {
  if (!is.null(survey_df)){
    df_housing_instability  <-  survey_df |>
      dplyr::filter(question_concept_id == 40192402) |> #specific Q
      # 40192402 = Think about the place you live. Do you have problems with any of the following? Select all that apply.
      dplyr::select(person_id, question_concept_id, answer_concept_id) |>
      dplyr::mutate(value = dplyr::case_when(
        answer_concept_id == 40192392 ~ 0, # None of the above
        answer_concept_id == 903096 ~ 999, # PMI: Skip
        TRUE ~ 1)) |> # any response besides none indicates a problem and is coded to 1
      dplyr::filter(value != 999) |> # remove skipped Q
      dplyr::group_by(person_id) |>
      dplyr::mutate(housing_instability = 1 %in% value) |> # did the participant note any problems
      dplyr::select(person_id, housing_instability) |> # only 2 columns in the final result
      dplyr::distinct(person_id, .keep_all = TRUE) |> # remove duplicate rows
      dplyr::right_join(survey_df |> # include participants without scores as NA
                          dplyr::group_by(person_id) |>
                          dplyr::summarize(),
                        by = 'person_id') |>
      dplyr::ungroup() # remember to ungroup
  }
  df_housing_instability
}