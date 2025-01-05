# English Proficient
# creates a nominal categorical variable with values 'Proficient', 'Not proficient', or 'Unknown' for participants who endorsed speaking a language other than English at home
# 'Proficient' denotes participants who endorsed speaking English 'Very well' or 'Well'
# 'Not proficient' denotes participants who endorsed speaking English 'Not well' or 'Not at all'

calc_english_proficient <- function(survey_df) {
  if (!is.null(survey_df)){
    df_english_proficient  <-  survey_df |>
      dplyr::filter(question_concept_id == 40192529) |> #specific Q
      # 40192529 = Since you speak a language other than English at home, we are interested in your own thoughts about how well you think you speak English. Would you say you speak English...
      dplyr::select(person_id, question_concept_id, answer_concept_id) |>
      dplyr::mutate(english_proficient = dplyr::case_when(
        answer_concept_id == 40192435 ~ "Proficient", # Very well
        answer_concept_id == 40192510 ~ "Proficient", # Well
        answer_concept_id == 40192405 ~ "Not proficient", # Not well
        answer_concept_id == 40192387 ~ "Not proficient", # Not at all
        answer_concept_id == 903087 ~ "Unknown", # PMI: Dont Know
        answer_concept_id == 903079 ~ "Unknown", # PMI: Prefer Not To Answer
        TRUE ~ "none")) |>
      dplyr::filter(english_proficient != "none") |> # remove skipped Q
      dplyr::select(person_id, english_proficient) |> # only 2 columns in the final result
      dplyr::distinct(person_id, .keep_all = TRUE) |> # remove duplicate rows
      dplyr::right_join(survey_df |> # include participants without scores as NA
                          dplyr::group_by(person_id) |>
                          dplyr::summarize(),
                        by = 'person_id') |>
      dplyr::ungroup() # remember to ungroup
  }
  df_english_proficient
}