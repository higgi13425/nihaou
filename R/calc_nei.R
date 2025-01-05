# Neighborhood Environment Index (NEI)
# creates a numeric score with range 0-6
# sum of individual item scores
# higher scores indicate a more favorable built environment for physical activity

calc_nei <- function(survey_df) {
  if (!is.null(survey_df)){
    df_nei  <-  survey_df |>
      dplyr::filter(question_concept_id %in% c(40192410, 40192431, 40192436, 40192437, 40192440, 40192458)) |> #specific 6 Qs
      # 40192410 = My neighborhood has several free or low-cost recreation facilities, such as parks, walking trails, bike paths, recreation centers, playgrounds, public swimming pools, etc. Would you say that you...
      # 40192431 = There are facilities to bicycle in or near my neighborhood, such as special lanes, separate paths or trails, or shared use paths for cycles and pedestrians. Would you say that you...
      # 40192436 = Many shops, stores, markets or other places to buy things I need are within easy walking distance of my home. Would you say that you...
      # 40192437 = There are sidewalks on most of the streets in my neighborhood. Would you say that you...
      # 40192440 = It is within a 10-15 minute walk to a transit stop (such as bus, train, trolley, or tram) from my home. Would you say that you...
      # 40192458 = What is the main type of housing in your neighborhood?
      dplyr::select(person_id, question_concept_id, answer_concept_id) |>
      dplyr::mutate(value = dplyr::case_when(
        # any legitimate response option other than the first 3 gets coded to a 1
        answer_concept_id == 40192527 ~ 0, # Somewhat disagree
        answer_concept_id == 40192422 ~ 0, # Strongly disagree
        answer_concept_id == 40192407 ~ 0, # Detached single-family housing
        answer_concept_id == 903087 ~ 999, # PMI: Dont Know
        answer_concept_id == 903096 ~ 999, # PMI: Skip
        answer_concept_id == 40192520 ~ 999, # Does not apply to my neighborhood
        TRUE ~ 1)) |>
      dplyr::filter(value != 999) |> # remove skipped Q
      dplyr::group_by(person_id) |>
      dplyr::mutate(nei = sum(value,
                              na.rm = TRUE),
                    nrows = length(value)) |> # did they answer 6 Q?
      dplyr::filter(nrows == 6) |> # include if answered 6
      dplyr::select(person_id, nei) |> # only 2 columns in the final result
      dplyr::distinct(person_id, .keep_all = TRUE) |> # remove duplicate rows
      dplyr::right_join(survey_df |> # include participants without scores as NA
                          dplyr::group_by(person_id) |>
                          dplyr::summarize(),
                        by = 'person_id') |>
      dplyr::ungroup() # remember to ungroup
  }
  df_nei
}