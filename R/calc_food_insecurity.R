# creates a binary categorical variable with value TRUE or FALSE
# TRUE denotes that the participant is at risk or currently experiencing food insecurity

calc_food_insecurity <- function(survey_df) {
  if (!is.null(survey_df)){
    df_food_insecurity  <-  survey_df |>
      dplyr::filter(question_concept_id %in% c(40192426, 40192517)) |> #specific 2 Qs
      # 40192426 = Within the past 12 months, were you worried whether the food you had bought just didn't last and you didn't have money to get more?
      # 40192517 = Within the past 12 months, were you worried whether your food would run out before you got money to buy more?
      dplyr::select(person_id, question_concept_id, answer_concept_id) |>
      dplyr::filter(answer_concept_id != 903096) |> # remove skipped Q
      dplyr::group_by(person_id) |>
      dplyr::mutate(food_insecurity = 40192508 %in% answer_concept_id | 40192488 %in% answer_concept_id,
                    # label as positive for food insecurity if answered positively to either question
                    # 40192508 = Often true
                    # 40192488 = Sometimes true
                    nrows = length(answer_concept_id)) |> # did they answer both Q?
      dplyr::filter(nrows == 2 | food_insecurity == TRUE) |> # include if answered both OR there is a positive
      dplyr::select(person_id, food_insecurity) |> # only 2 columns in the final result
      dplyr::distinct(person_id, .keep_all = TRUE) |> # remove duplicate rows
      dplyr::right_join(survey_df |> # include participants without scores as NA
                          dplyr::group_by(person_id) |>
                          dplyr::summarize(),
                        by = 'person_id') |>
      dplyr::ungroup() # remember to ungroup
  }
  df_food_insecurity
}