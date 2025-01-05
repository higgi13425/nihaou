# Speaks Other Language at Home
# creates a nominal categorical variable with values 'Yes', 'No', or 'PMI: Prefer Not To Answer'
# 'Yes' denotes that the participant speaks a language other than English at home

calc_other_language <- function(survey_df) {
  if (!is.null(survey_df)){
    df_other_language  <-  survey_df |>
      dplyr::filter(question_concept_id == 40192526) |> #specific Q
      # 40192526 = Do you speak a language other than English at home?
      dplyr::select(person_id, question_concept_id, answer) |>
      dplyr::filter(answer != "PMI: Skip") |> # remove skipped Q
      dplyr::mutate(other_language = answer) |>
      dplyr::select(person_id, other_language) |> # only 2 columns in the final result
      dplyr::distinct(person_id, .keep_all = TRUE) |> # remove duplicate rows
      dplyr::right_join(survey_df |> # include participants without scores as NA
                          dplyr::group_by(person_id) |>
                          dplyr::summarize(),
                        by = 'person_id')
  }
  df_other_language
}