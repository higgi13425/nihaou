# Level of English Proficiency
# creates an ordinal categorical variable describing level of proficiency in English for participants who endorsed speaking a language other than English at home

calc_english_level <- function(survey_df) {
  if (!is.null(survey_df)){
    df_english_level  <-  survey_df |>
      dplyr::filter(question_concept_id == 40192529) |> #specific Q
      # 40192529 = Since you speak a language other than English at home, we are interested in your own thoughts about how well you think you speak English. Would you say you speak English...
      dplyr::select(person_id, question_concept_id, answer) |>
      dplyr::filter(answer != "PMI: Skip") |> # remove skipped Q
      dplyr::mutate(english_level = answer) |>
      dplyr::select(person_id, english_level) |> # only 2 columns in the final result
      dplyr::distinct(person_id, .keep_all = TRUE) |> # remove duplicate rows
      dplyr::right_join(survey_df |> # include participants without scores as NA
                          dplyr::group_by(person_id) |>
                          dplyr::summarize(),
                        by = 'person_id')
  }
  df_english_level
}