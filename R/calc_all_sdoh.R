# calculates all 28 social determinants of health measures

calc_all_sdoh <- function(survey_df) {
  if (!is.null(survey_df)){
    df_all_sdoh <- list(nihaou::calc_cohesion(survey_df),
                        nihaou::calc_disorder(survey_df),
                        nihaou::calc_density(survey_df),
                        nihaou::calc_spa(survey_df),
                        nihaou::calc_walkability(survey_df),
                        nihaou::calc_nei(survey_df),
                        nihaou::calc_social_support(survey_df),
                        nihaou::calc_ins_support(survey_df),
                        nihaou::calc_emo_support(survey_df),
                        nihaou::calc_loneliness(survey_df),
                        nihaou::calc_edd_situation(survey_df),
                        nihaou::calc_edd_frequency(survey_df),
                        nihaou::calc_edd_chronicity(survey_df),
                        nihaou::calc_hcd_ever(survey_df),
                        nihaou::calc_hcd_count(survey_df),
                        nihaou::calc_hcd_sum(survey_df),
                        nihaou::calc_hcd_mean(survey_df),
                        nihaou::calc_food_insecurity(survey_df),
                        nihaou::calc_housing_insecurity(survey_df),
                        nihaou::calc_num_moves(survey_df),
                        nihaou::calc_housing_instability(survey_df),
                        nihaou::calc_stress_sum(survey_df),
                        nihaou::calc_stress_category(survey_df),
                        nihaou::calc_spirit(survey_df),
                        nihaou::calc_religious_attendance(survey_df),
                        nihaou::calc_other_language(survey_df),
                        nihaou::calc_english_level(survey_df),
                        nihaou::calc_english_proficient(survey_df)) |>
    purrr::reduce(dplyr::full_join, by = "person_id")
  }
  df_all_sdoh
}