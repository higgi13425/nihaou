#' @title Calculate neighborhood density level
#'
#' @param survey_df - a survey dataframe including SDOH
#'
#' @return df_density - a dataframe with person_id and density level
#' @export
#'
#' @examples
#' calc_density(fake_survey_df)
#'
calc_density <- function(survey_df) {
  if (!is.null(survey_df)){
    df_density  <-  survey_df |>
      dplyr::filter(question_concept_id == 40192458) |> #specific 1 Q
      # 40192458 = What is the main type of housing in your neighborhood?
      dplyr::select(person_id, question_concept_id, answer_concept_id) |>
      dplyr::mutate(density = dplyr::case_when(
        answer_concept_id == 40192407 ~ "Low", # Detached single-family housing
        answer_concept_id == 903087 ~ "none", # PMI: Dont Know
        answer_concept_id == 903096 ~ "none", # PMI: Skip
        answer_concept_id == 40192520 ~ "none", # Does not apply to my neighborhood
        TRUE ~ "High")) |>
      dplyr::filter(density != "none") |> # remove NAs
      dplyr::group_by(person_id) |>
      dplyr::select(person_id, density) |>
      dplyr::right_join(survey_df |> # include participants without scores as NA
                          dplyr::group_by(person_id) |>
                          dplyr::summarize(),
                        by = 'person_id') |>
      dplyr::ungroup() # remember to ungroup
  }
  df_density
}

