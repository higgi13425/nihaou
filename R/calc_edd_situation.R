# Everyday discrimination (edd)
# Situation-based Scoring
# creates a numeric score with range 0-9
# indicates how many questions the participant responded to with something other than 'Never'
# higher scores indicate more frequent perceived experience of unfair treatment

# reason is an optional argument
# can limit to participants who provided a particular reason for discrimination, e.g. race or age
# see survey for options

calc_edd_situation <- function(survey_df, reason) {
  if (!is.null(survey_df)){
    df_edd_situation  <-  survey_df |>
      dplyr::filter(question_concept_id %in% c(40192380, 40192395, 40192416, 40192451, 40192466, 40192489, 40192490, 40192496, 40192519)) |> #specific 9 Qs
      # 40192380 = In your day-to-day life, how often do people act as if they are afraid of you?
      # 40192395 = In your day-to-day life, how often do people act as if they think you are dishonest?
      # 40192416 = In your day-to-day life, how often do you receive poorer service than other people at restaurants or stores?
      # 40192451 = In your day-to-day life, how often are you threatened or harassed?
      # 40192466 = In your day-to-day life, how often are you treated with less courtesy than other people?
      # 40192489 = In your day-to-day life, how often are you treated with less respect than other people?
      # 40192490 = In your day-to-day life, how often do people act as if they think you are not smart?
      # 40192496 = In your day-to-day life, how often do people act as if they're better than you are?
      # 40192519 = In your day-to-day life, how often are you called names or insulted?
      dplyr::select(person_id, question_concept_id, answer_concept_id) |>
      dplyr::mutate(value = dplyr::case_when(
        answer_concept_id == 40192465 ~ 0, # Never
        answer_concept_id == 903096 ~ 999, # PMI: Skip
        TRUE ~ 1)) |> # any response besides "Never" is treated as 1
      dplyr::filter(value != 999) |> # remove skipped Q
      dplyr::group_by(person_id) |>
      dplyr::mutate(edd_situation = sum(value,
                                        na.rm = TRUE),
                    nrows = length(value)) |> # did they answer all 9 Q?
      dplyr::filter(nrows == 9) |> # include if answered 9
      dplyr::select(person_id, edd_situation) |> # only 2 columns in the final result
      dplyr::distinct(person_id, .keep_all = TRUE) |> # remove duplicate rows
      dplyr::ungroup() # remember to ungroup
    if (!missing(reason)) { # if reason for perceived discrimination is provided
      x <- survey_df |> 
        dplyr::filter(question_concept_id == 40192428 & answer == reason)
      # 40192428 = Discrimination: What do you think is the main reason for these experiences?
      y <- x$person_id # which participants indicated the given reason for discrimination
      df_edd_situation <- df_edd_situation |> dplyr::filter(person_id %in% y) # filter to these participants
    }
    df_edd_situation <- df_edd_situation |> 
      dplyr::right_join(survey_df |> # include participants without scores as NA
                          dplyr::group_by(person_id) |>
                          dplyr::summarize(),
                        by = 'person_id')
  }
  df_edd_situation
}