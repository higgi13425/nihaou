#' @title Calculate neighborhood PANES (Physical Activity Neighborhood Environment Scale) aka Support for Physical Activity (spa) score
#'
#' @param survey_df - a survey dataframe including SDOH
#'
#' @return df_spa - a dataframe with person_id and spa score that shows neighborhood support for physical activity
#' @export
#' @examples
#' calc_spa(fake_survey_df)
#'
calc_spa <- function(survey_df) {
  if (!is.null(survey_df)){
    df_spa  <-  survey_df |>
      dplyr::filter(question_concept_id %in% c(40192436, 40192440, 40192437, 40192431, 40192410, 40192492, 40192414)) |> #specific 7 Qs
      # 40192436 = Many shops, stores, markets or other places to buy things I need are within easy walking distance of my home. Would you say that you...
      # 40192440 = It is within a 10-15 minute walk to a transit stop (such as bus, train, trolley, or tram) from my home. Would you say that you...
      # 40192437 = There are sidewalks on most of the streets in my neighborhood. Would you say that you...
      # 40192431 = There are facilities to bicycle in or near my neighborhood, such as special lanes, separate paths or trails, or shared use paths for cycles and pedestrians. Would you say that you...
      # 40192410 = My neighborhood has several free or low-cost recreation facilities, such as parks, walking trails, bike paths, recreation centers, playgrounds, public swimming pools, etc. Would you say that you...
      # 40192492 = The crime rate in my neighborhood makes it unsafe to go on walks at night. Would you say that you...
      # 40192414 = The crime rate in my neighborhood makes it unsafe to go on walks during the day. Would you say that you...
      dplyr::select(person_id, question_concept_id, answer_concept_id) |>
      dplyr::mutate(value = dplyr::case_when(
        answer_concept_id == 40192514 ~ 4, # Strongly agree
        answer_concept_id == 40192478 ~ 3, # Somewhat agree
        answer_concept_id == 40192527 ~ 2, # Somewhat disagree
        answer_concept_id == 40192422 ~ 1, # Strongly disagree
        TRUE ~ 999)) |>
      dplyr::filter(value != 999) |> # remove skipped Q
      dplyr::mutate(value = dplyr::case_when(
        # reverse code 2 Qs
        question_concept_id == 40192492 ~ 5 - value,
        question_concept_id == 40192414 ~ 5 - value,
        TRUE ~ value)) |>
      dplyr::group_by(person_id) |>
      dplyr::mutate(spa = sum(value,
                              na.rm = TRUE),
                    nrows = length(value)) |> # did they answer all 7 Q?
      dplyr::filter(nrows == 7) |> # kick out if not 7
      dplyr::select(person_id, spa) |>
      dplyr::distinct(person_id, .keep_all = TRUE) |>
      dplyr::right_join(survey_df |> # include participants without scores as NA
                          dplyr::group_by(person_id) |>
                          dplyr::summarize(),
                        by = 'person_id') |>
      dplyr::ungroup() # remember to ungroup
  }
  df_spa
}


