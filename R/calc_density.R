#' @title Calculate neighborhood density level
#'
#' @param survey_df - a survey dataframe including SDOH
#'
#' @return df_density - a dataframe with person_id and density level
#' @export
#'
#' @examples
calc_density <- function(survey_df) {
  if (!is.null(survey_df)){
    df_density  <-  survey_df |>
      dplyr::filter(question_concept_id %in% c(40192458)) |> #specific 1 Q
      dplyr::select(person_id, question_concept_id, answer) |>
      dplyr::mutate(density = dplyr::case_when(
        answer == "Detached single-family housing" ~ "Low",
        answer == "PMI: Dont Know" ~ "High",
        answer == "PMI: Skip" ~ "High",
        answer == "Does not apply to my neighborhood" ~ "High",
        TRUE ~ "none")) |>
      dplyr::filter(density != "none") |> # remove NAs
      dplyr::group_by(person_id) |>
      dplyr::select(person_id, density) |>
      dplyr::ungroup() # remember to ungroup
  }
  df_density
}
