# Healthcare discrimination
# Continuous Scoring (Item Average)
# creates a numeric score with range 1-5
# mean of individual item scores
# higher scores indicate greater perceived discrimination in health care

calc_hcd_mean <- function(survey_df) {
  if (!is.null(survey_df)){
    df_hcd_mean  <-  survey_df |>
      dplyr::filter(question_concept_id %in% c(40192383, 40192394, 40192423, 40192425, 40192497, 40192503, 40192505)) |> #specific 7 Qs
      # 40192383 = How often does a doctor or nurse act as if he or she is better than you when you go to a doctor's office or other health care provider?
      # 40192394 = How often do you feel like a doctor or nurse is not listening to what you were saying. when you go to a doctor's office or other health care provider?
      # 40192423 = How often does a doctor or nurse act as if he or she is afraid of you when you go to a doctor's office or other health care provider?
      # 40192425 = How often are you treated with less respect than other people when you go to a doctor's office or other health care provider?
      # 40192497 = How often are you treated with less courtesy than other people when you go to a doctor's office or other health care provider?
      # 40192503 = How often do you receive poorer service than others when you go to a doctor's office or other health care provider?
      # 40192505 = How often does a doctor or nurse act as if he or she thinks you are not smart when you go to a doctor's office or other health care provider?
      dplyr::select(person_id, question_concept_id, answer_concept_id) |>
      dplyr::mutate(value = dplyr::case_when(
        answer_concept_id == 40192465 ~ 1, # Never
        answer_concept_id == 40192481 ~ 2, # Rarely
        answer_concept_id == 40192429 ~ 3, # Sometimes
        answer_concept_id == 40192382 ~ 4, # Most of the time
        answer_concept_id == 40192515 ~ 5, # Always
        TRUE ~ 999)) |>
      dplyr::filter(value != 999) |> # remove skipped Q
      dplyr::group_by(person_id) |>
      dplyr::mutate(hcd_mean = round(mean(value,
                                          na.rm = TRUE), 2), # rounded to 2 decimals
                    nrows = length(value)) |> # did they answer all 7 Q?
      dplyr::filter(nrows == 7) |> # include if answered 7
      dplyr::select(person_id, hcd_mean) |> # only 2 columns in the final result
      dplyr::distinct(person_id, .keep_all = TRUE) |> # remove duplicate rows
      dplyr::right_join(survey_df |> # include participants without scores as NA
                          dplyr::group_by(person_id) |>
                          dplyr::summarize(),
                        by = 'person_id') |>
      dplyr::ungroup() # remember to ungroup
  }
  df_hcd_mean
}