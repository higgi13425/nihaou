# Housing Insecurity
# creates a binary categorical variable with value TRUE or FALSE
# TRUE denotes that the participant is at risk or currently experiencing housing insecurity (i.e., moved 2 or more times in the past year)

calc_housing_insecurity <- function(survey_df) {
  if (!is.null(survey_df)){
    df_housing_insecurity  <-  survey_df |>
      dplyr::filter(question_concept_id == 40192441) |> #specific Q
      # 40192441 = In the last 12 months, how many times have you or your family moved from one home to another? Number of moves in past 12 months:
      dplyr::select(person_id, question_concept_id, answer) |>
      dplyr::filter(answer != "PMI: Skip") |> # remove skipped Q
      dplyr::mutate(housing_insecurity = dplyr::case_when(
        answer %in% c("0","1") ~ FALSE, # 0 or 1 moves = false for household insecurity
        TRUE ~ TRUE)) |> # any response greater than 1 = true for household insecurity
      dplyr::select(person_id, housing_insecurity) |> # only 2 columns in the final result
      dplyr::right_join(survey_df |> # include participants without data as NA
                          dplyr::group_by(person_id) |>
                          dplyr::summarize(),
                        by = 'person_id')
  }
  df_housing_insecurity
}