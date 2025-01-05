# Neighborhood Walkability
# creates a numeric score with range 2-8
# sum of individual item scores
# higher scores indicate higher neighborhood walkability

calc_walkability <- function(survey_df) {
  if (!is.null(survey_df)){
    df_walkability  <-  survey_df |>
      dplyr::filter(question_concept_id %in% c(40192414, 40192492)) |> #specific 2 Qs
      # 40192414 = The crime rate in my neighborhood makes it unsafe to go on walks during the day. Would you say that you...
      # 40192492 = The crime rate in my neighborhood makes it unsafe to go on walks at night. Would you say that you...
      dplyr::select(person_id, question_concept_id, answer_concept_id) |>
      dplyr::mutate(value = dplyr::case_when(
        answer_concept_id == 40192514 ~ 1, # Strongly agree
        answer_concept_id == 40192478 ~ 2, # Somewhat agree
        answer_concept_id == 40192527 ~ 3, # Somewhat disagree
        answer_concept_id == 40192422 ~ 4, # Strongly disagree
        TRUE ~ 999)) |>
      dplyr::filter(value != 999) |> # remove skipped Q
      dplyr::group_by(person_id) |>
      dplyr::mutate(walkability = sum(value,
                                      na.rm = TRUE),
                    nrows = length(value)) |> # did they answer both Q?
      dplyr::filter(nrows == 2) |> # include if answered both
      dplyr::select(person_id, walkability) |> # only 2 columns in the final result
      dplyr::distinct(person_id, .keep_all = TRUE) |> # remove duplicate rows
      dplyr::right_join(survey_df |> # include participants without scores as NA
                          dplyr::group_by(person_id) |>
                          dplyr::summarize(),
                        by = 'person_id') |>
      dplyr::ungroup() # remember to ungroup
  }
  df_walkability
}