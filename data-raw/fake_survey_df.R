## code to prepare `fake_survey_df` dataset goes here

library(tidyverse)
tibble(
  person_id = c(rep(1001, 81), rep(1002, 81), rep(1003, 81), rep(1004, 81), rep(1005, 81), rep(1006, 81), rep(1007, 81), rep(1008, 81), rep(1009, 81), rep(1010, 81)),
  question_concept_id = rep(c(40192380, 40192381, 40192383, 40192384, 40192386, 40192388, 40192390, 40192394, 40192395, 40192396, 40192397, 40192398, 40192399, 40192400, 40192401, 40192402, 40192404, 40192410, 40192411, 40192412, 40192414, 40192415, 40192416, 40192417, 40192419, 40192420, 40192423, 40192425, 40192426, 40192428, 40192431, 40192436, 40192437, 40192439, 40192440, 40192441, 40192442, 40192443, 40192445, 40192446, 40192449, 40192451, 40192452, 40192456, 40192457, 40192458, 40192462, 40192463, 40192466, 40192469, 40192470, 40192471, 40192475, 40192476, 40192480, 40192489, 40192490, 40192491, 40192492, 40192493, 40192494, 40192496, 40192497, 40192498, ()40192499, 40192500, 40192501, 40192503, 40192504, 40192505, 40192506, 40192507, 40192511, 40192516, 40192517, 40192519, 40192522, 40192525, 40192526, 40192528, 40192529), 10),
  answer = c(rep("Strongly Agree",90),
             rep("Agree",90),
             rep("Disagree",90),
             rep("Strongly Disagree",90),
             rep("Agree",90),
             rep("Disagree",90),
             rep("Strongly Disagree",90),
             rep("Agree",90),
             rep("Disagree", 90))) ->
    fake_survey_df

# set randomization seed
set.seed(123)

# section here to add specific other values to fake_survey_df
# like missing values, PMI values, Neutral, etc.
# our goal is to test every possible answer
# for 40192380
fake_survey_df[1,3] <- "A few times a month"
fake_survey_df[82,3] <- "A few times a year"
fake_survey_df[163,3] <- "Almost everyday"
fake_survey_df[244,3] <- "At least once a week"
fake_survey_df[325,3] <- "Less than once a year"
fake_survey_df[406,3] <- "Never"
fake_survey_df[487,3] <- "Less than once a year"
fake_survey_df[568,3] <- "Never"
fake_survey_df[649,3] <- "Never"
fake_survey_df[730,3] <- "At least once a week"

# for 40192381
fake_survey_df[2,3] <- "Almost Never"
fake_survey_df[83,3] <- "PMI: Skip"
fake_survey_df[164,3] <- "Fairly Often"
fake_survey_df[245,3] <- "Sometimes"
fake_survey_df[326,3] <- "Never"
fake_survey_df[407,3] <- "Very Often"
fake_survey_df[488,3] <- "Sometimes"
fake_survey_df[569,3] <- "Fairly Often"
fake_survey_df[650,3] <- "Almost Never"
fake_survey_df[731,3] <- "Sometimes"

# for 40192383 # 3 of 81
fake_survey_df[3,3] <- "Always"
fake_survey_df[84,3] <- "Most of the time"
fake_survey_df[165,3] <- "Sometimes"
fake_survey_df[246,3] <- "Rarely"
fake_survey_df[327,3] <- "Never"
fake_survey_df[408,3] <- "Most of the time"
fake_survey_df[489,3] <- "Sometimes"
fake_survey_df[570,3] <- "Rarely"
fake_survey_df[651,3] <- "Always"
fake_survey_df[732,3] <- "Sometimes"

# nothing to do for 40192384, 40192386
# for 40192388 # 6 of 81
fake_survey_df[6,3] <- "A little of the time"
fake_survey_df[87,3] <- "All of the time"
fake_survey_df[168,3] <- "Most of the time"
fake_survey_df[249,3] <- "None of the time"
fake_survey_df[330,3] <- "Some of the time"
fake_survey_df[411,3] <- "PMI: Skip"
fake_survey_df[492,3] <- "A little of the time"
fake_survey_df[573,3] <- "None of the time"
fake_survey_df[654,3] <- "Some of the time"
fake_survey_df[735,3] <- "Most of the time"

# for 40192390 # 7 of 81
fake_survey_df[7,3] <- "Never"
fake_survey_df[88,3] <- "Never"
fake_survey_df[169,3] <- "Often"
fake_survey_df[250,3] <- "Sometimes"
fake_survey_df[331,3] <- "Rarely"
fake_survey_df[412,3] <- "Often"
fake_survey_df[493,3] <- "Sometimes"
fake_survey_df[574,3] <- "Often"
fake_survey_df[655,3] <- "Rarely"
fake_survey_df[736,3] <- "Sometimes"

# for 40192394 # 8 of 81
fake_survey_df[8,3] <- "Always"
fake_survey_df[89,3] <- "Most of the time"
fake_survey_df[170,3] <- "Rarely"
fake_survey_df[251,3] <- "Sometimes"
fake_survey_df[332,3] <- "Never"
fake_survey_df[413,3] <- "Most of the time"
fake_survey_df[494,3] <- "Sometimes"
fake_survey_df[575,3] <- "Rarely"
fake_survey_df[656,3] <- "Never"
fake_survey_df[737,3] <- "Sometimes"

# for 40192395 # 9 of 81
fake_survey_df[9,3] <- "A few times a month"
fake_survey_df[90,3] <- "A few times a year"
fake_survey_df[171,3] <- "Almost everyday"
fake_survey_df[252,3] <- "At least once a week"
fake_survey_df[333,3] <- "Never"
fake_survey_df[414,3] <- "Less than once a year"
fake_survey_df[495,3] <- "A few times a month"
fake_survey_df[576,3] <- "Almost everyday"
fake_survey_df[657,3] <- "Never"
fake_survey_df[738,3] <- "A few times a month"

# for 40192396 #10 of 81
fake_survey_df[10,3] <- "Almost Never"
fake_survey_df[91,3] <- "Fairly Often"
fake_survey_df[172,3] <- "Almost Never"
fake_survey_df[253,3] <- "Sometimes"
fake_survey_df[334,3] <- "Very Often"
fake_survey_df[415,3] <- "Never"
fake_survey_df[496,3] <- "Sometimes"
fake_survey_df[577,3] <- "Fairly Often"
fake_survey_df[658,3] <- "Almost Never"
fake_survey_df[739,3] <- "Sometimes"

# for 40192397 #11 of 81
fake_survey_df[11,3] <- "Never"
fake_survey_df[92,3] <- "Often"
fake_survey_df[173,3] <- "Rarely"
fake_survey_df[254,3] <- "Sometimes"
fake_survey_df[335,3] <- "Rarely"
fake_survey_df[416,3] <- "Never"
fake_survey_df[497,3] <- "Sometimes"
fake_survey_df[578,3] <- "Often"
fake_survey_df[659,3] <- "Rarely"
fake_survey_df[740,3] <- "Sometimes"

# for 40192398 #12 of 81
fake_survey_df[12,3] <- "Never"
fake_survey_df[93,3] <- "Often"
fake_survey_df[174,3] <- "Rarely"
fake_survey_df[255,3] <- "Sometimes"
fake_survey_df[336,3] <- "Often"
fake_survey_df[417,3] <- "Never"
fake_survey_df[498,3] <- "Rarely"
fake_survey_df[579,3] <- "Often"
fake_survey_df[660,3] <- "Never"
fake_survey_df[741,3] <- "Sometimes"

# for 40192399 #13 of 81
fake_survey_df[13,3] <- "A little of the time"
fake_survey_df[94,3] <- "All of the time"
fake_survey_df[175,3] <- "Most of the time"
fake_survey_df[256,3] <- "Some of the time"
fake_survey_df[337,3] <- "None of the time"
fake_survey_df[418,3] <- "Some of the time"
fake_survey_df[499,3] <- "A little of the time"
fake_survey_df[580,3] <- "All of the time"
fake_survey_df[661,3] <- "None of the time"
fake_survey_df[742,3] <- "Some of the time"

# for 40192400 - nothing to do #14 of 81
#
# for 40192401 #15 of 81
fake_survey_df[15,3] <- "Every day"
fake_survey_df[96,3] <- "Many times a day"
fake_survey_df[177,3] <- "Most days"
fake_survey_df[258,3] <- "Never or almost never"
fake_survey_df[339,3] <- "Once in a while"
fake_survey_df[420,3] <- "Some days"
fake_survey_df[501,3] <- "Every day"
fake_survey_df[582,3] <- "Many times a day"
fake_survey_df[663,3] <- "Never or almost never"
fake_survey_df[744,3] <- "Once in a while"

# for 40192402 #16 of 81
fake_survey_df[16,3] <- "Bug infestation"
fake_survey_df[97,3] <- "Inadeqate heat"
fake_survey_df[178,3] <- "Lead paint or pipes"
fake_survey_df[259,3] <- "Mold"
fake_survey_df[340,3] <- "No or not working smoke detector"
fake_survey_df[421,3] <- "None of the above"
fake_survey_df[502,3] <- "Oven or stove not working"
fake_survey_df[583,3] <- "Water leaks"
fake_survey_df[664,3] <- "None of the above"
fake_survey_df[745,3] <- "None of the above"

# for 40192404 - nothing to do #17 of 81

# for 40192410 - # 18 of 81
fake_survey_df[18,3] <- "Somewhat agree"
fake_survey_df[99,3] <- "Somewhat disagree"
fake_survey_df[180,3] <- "Strongly agree"
fake_survey_df[261,3] <- "Strongly disagree"
fake_survey_df[342,3] <- "Somewhat agree"
fake_survey_df[423,3] <- "Somewhat disagree"
fake_survey_df[504,3] <- "Strongly agree"
fake_survey_df[585,3] <- "Strongly agree"
fake_survey_df[666,3] <- "Strongly disagree"
fake_survey_df[747,3] <- "Strongly disagree"


# for 40192411 is #19 of 81 - add some neutrals and a strongly agree
fake_survey_df[19,3] <- "Neutral (neither agree nor disagree)"
fake_survey_df[100,3] <- "Strongly Agree"
fake_survey_df[343,3] <- "Neutral (neither agree nor disagree)"

# for 40192412 - nothing to do

# for 40192414 - #21 of 81
fake_survey_df[21,3] <- "Somewhat agree"
fake_survey_df[102,3] <- "Somewhat disagree"
fake_survey_df[183,3] <- "Strongly agree"
fake_survey_df[264,3] <- "Strongly disagree"
fake_survey_df[345,3] <- "Somewhat agree"
fake_survey_df[426,3] <- "Somewhat disagree"
fake_survey_df[507,3] <- "Strongly agree"
fake_survey_df[588,3] <- "Strongly agree"
fake_survey_df[669,3] <- "Strongly disagree"
fake_survey_df[750,3] <- "Strongly disagree"


# for 40192415 with randomization
# 22 of 81
set.seed(981)
rand <- runif(10,0,1)
answer <- case_when(rand < 0.15 ~ "Every day",
                    rand < 0.3 ~ "Many times a day",
                    rand < 0.45 ~ "Most days",
                    rand < 0.6 ~ "Some days",
                    rand < 0.75 ~ "Once in a while",
                    TRUE ~ "Never or almost never")
fake_survey_df[22,3] <- answer[1]
fake_survey_df[103,3] <- answer[2]
fake_survey_df[184,3] <- answer[3]
fake_survey_df[265,3] <- answer[4]
fake_survey_df[346,3] <- answer[5]
fake_survey_df[427,3] <- answer[6]
fake_survey_df[508,3] <- answer[7]
fake_survey_df[589,3] <- answer[8]
fake_survey_df[670,3] <- answer[9]
fake_survey_df[751,3] <- answer[10]

# for 40192416 # 23 of 81

fake_survey_df[23,3] <- "A few times a month"
fake_survey_df[104,3] <- "A few times a year"
fake_survey_df[185,3] <- "Less than once a year"
fake_survey_df[266,3] <- "Never"
fake_survey_df[347,3] <- "Almost everyday"
fake_survey_df[428,3] <- "At least once a week"
fake_survey_df[509,3] <- "A few times a month"
fake_survey_df[590,3] <- "At least once a week"
fake_survey_df[671,3] <- "Almost everyday"
fake_survey_df[752,3] <- "A few times a year"

# for 40192417 - add neutrals # 24 of 81
fake_survey_df[186,3] <- "Neutral (neither agree nor disagree)"
fake_survey_df[267,3] <- "Neutral (neither agree nor disagree)"
fake_survey_df[348,3] <- "Strongly Agree"

# for 40192419 #25 of 81
fake_survey_df[25,3] <- "Almost Never"
fake_survey_df[106,3] <-  "Sometimes"
fake_survey_df[187,3] <- "Fairly Often"
fake_survey_df[268,3] <- "Never"
fake_survey_df[349,3] <- "Very Often"
fake_survey_df[430,3] <- "Almost Never"
fake_survey_df[511,3] <- "Sometimes"
fake_survey_df[592,3] <- "Fairly Often"
fake_survey_df[673,3] <- "Never"
fake_survey_df[754,3] <- "Very Often"

# for 40192420 - nothing to do # 26 of 81
#
# for 40192423 #27 of 81
fake_survey_df[27,3] <- "Never"
fake_survey_df[108,3] <- "Sometimes"
fake_survey_df[189,3] <- "Most of the time"
fake_survey_df[270,3] <- "Rarely"
fake_survey_df[351,3] <- "Always"
fake_survey_df[432,3] <- "Never"
fake_survey_df[513,3] <- "Sometimes"
fake_survey_df[594,3] <- "Most of the time"
fake_survey_df[675,3] <- "Rarely"
fake_survey_df[756,3] <- "Always"

# for 40192425 with randomization #28 of 81
set.seed(654)
rand <- runif(10,0,1)
answer <- case_when(rand < 0.2 ~ "Always",
                    rand < 0.4 ~ "Most of the time",
                    rand < 0.6 ~ "Rarely",
                    rand < 0.80 ~ "Never",
                    TRUE ~ "Sometimes")
fake_survey_df[28,3] <- answer[1]
fake_survey_df[109,3] <- answer[2]
fake_survey_df[190,3] <- answer[3]
fake_survey_df[271,3] <- answer[4]
fake_survey_df[352,3] <- answer[5]
fake_survey_df[433,3] <- answer[6]
fake_survey_df[514,3] <- answer[7]
fake_survey_df[595,3] <- answer[8]
fake_survey_df[676,3] <- answer[9]
fake_survey_df[757,3] <- answer[10]

# for 40192426 #29 of 81
fake_survey_df[29,3] <- "Never true"
fake_survey_df[110,3] <- "Often true"
fake_survey_df[191,3] <- "Sometimes true"
fake_survey_df[272,3] <- "Often true"
fake_survey_df[353,3] <- "Never true"
fake_survey_df[434,3] <- "Sometimes true"
fake_survey_df[515,3] <- "Often true"
fake_survey_df[596,3] <- "Sometimes true"
fake_survey_df[677,3] <- "Never true"
fake_survey_df[758,3] <- "PMI: Skip"

# for 40192428 #30 of 81
fake_survey_df[30,3] <- "Some other aspect of your physical appearance"
fake_survey_df[111,3] <- "Your age"
fake_survey_df[192,3] <- "Your ancestry or national origins"
fake_survey_df[273,3] <- "Your education or income level"
fake_survey_df[354,3] <- "Your gender"
fake_survey_df[435,3] <- "Your height"
fake_survey_df[516,3] <- "Your race"
fake_survey_df[597,3] <- "Your religion"
fake_survey_df[678,3] <- "Your sexual orientation"
fake_survey_df[759,3] <- "Your weight"

# for 40192431 - # 31 of 81
fake_survey_df[31,3] <- "Does not apply to my neighborhood"
fake_survey_df[112,3] <- "Somewhat agree"
fake_survey_df[193,3] <- "Strongly agree"
fake_survey_df[274,3] <- "Strongly disagree"
fake_survey_df[355,3] <- "Strongly agree"
fake_survey_df[436,3] <- "Somewhat disagree"
fake_survey_df[517,3] <- "Somewhat agree"
fake_survey_df[598,3] <- "Strongly disagree"
fake_survey_df[679,3] <- "Strongly disagree"
fake_survey_df[760,3] <- "Strongly agree"

# for 40192436 - # 32 of 81
fake_survey_df[32,3] <- "PMI: Dont know"
fake_survey_df[113,3] <- "Somewhat agree"
fake_survey_df[194,3] <- "Somewhat disagree"
fake_survey_df[275,3] <- "Somewhat disagree"
fake_survey_df[356,3] <- "Strongly agree"
fake_survey_df[437,3] <- "Strongly disagree"
fake_survey_df[518,3] <- "Strongly disagree"
fake_survey_df[599,3] <- "Somewhat agree"
fake_survey_df[680,3] <- "Somewhat disagree"
fake_survey_df[761,3] <- "Strongly agree"

# for 40192437 - # 33 of 81
fake_survey_df[33,3] <- "Does not apply to my neighborhood"
fake_survey_df[114,3] <- "Somewhat agree"
fake_survey_df[195,3] <- "Somewhat disagree"
fake_survey_df[276,3] <- "Strongly disagree"
fake_survey_df[357,3] <- "Strongly agree"
fake_survey_df[438,3] <- "Somewhat agree"
fake_survey_df[519,3] <- "Somewhat agree"
fake_survey_df[600,3] <- "Somewhat disagree"
fake_survey_df[681,3] <- "Strongly disagree"
fake_survey_df[762,3] <- "Strongly agree"

# for 40192439 with randomization #34 of 81
set.seed(537)
rand <- runif(10,0,1)
answer <- case_when(rand < 0.2 ~ "A little of the time",
                    rand < 0.4 ~ "All of the time",
                    rand < 0.6 ~ "Most of the time",
                    rand < 0.8 ~ "None of the time",
                    TRUE ~ "Some of the time")
fake_survey_df[34,3] <- answer[1]
fake_survey_df[115,3] <- answer[2]
fake_survey_df[196,3] <- answer[3]
fake_survey_df[277,3] <- answer[4]
fake_survey_df[358,3] <- answer[5]
fake_survey_df[439,3] <- answer[6]
fake_survey_df[520,3] <- answer[7]
fake_survey_df[601,3] <- answer[8]
fake_survey_df[682,3] <- answer[9]
fake_survey_df[763,3] <- answer[10]

# for 40192440 #35 of 81
fake_survey_df[35,3] <- "Somewhat agree"
fake_survey_df[116,3] <- "Somewhat disagree"
fake_survey_df[197,3] <- "Strongly agree"
fake_survey_df[278,3] <- "Strongly disagree"
fake_survey_df[359,3] <- "Somewhat agree"
fake_survey_df[440,3] <- "Somewhat disagree"
fake_survey_df[521,3] <- "Strongly agree"
fake_survey_df[602,3] <- "Strongly agree"
fake_survey_df[683,3] <- "Strongly disagree"
fake_survey_df[764,3] <- "Strongly disagree"

# for 40192441 #36 of 81 - problem as changed to numeric - left these as charcter digits
fake_survey_df[36,3] <- '0'
fake_survey_df[117,3] <- '1'
fake_survey_df[198,3] <- '2'
fake_survey_df[279,3] <- '3'
fake_survey_df[360,3] <- '4'
fake_survey_df[441,3] <- '5'
fake_survey_df[522,3] <- '6'
fake_survey_df[603,3] <- '7'
fake_survey_df[684,3] <- '8'
fake_survey_df[765,3] <- '9'

# for 40192442 #37 of 81
set.seed(577)
rand <- runif(10,0,1)
answer <- case_when(rand < 0.2 ~ "A little of the time",
                    rand < 0.4 ~ "All of the time",
                    rand < 0.6 ~ "Most of the time",
                    rand < 0.8 ~ "None of the time",
                    TRUE ~ "Some of the time")
fake_survey_df[37,3] <- answer[1]
fake_survey_df[118,3] <- answer[2]
fake_survey_df[199,3] <- answer[3]
fake_survey_df[280,3] <- answer[4]
fake_survey_df[361,3] <- answer[5]
fake_survey_df[442,3] <- answer[6]
fake_survey_df[523,3] <- answer[7]
fake_survey_df[604,3] <- answer[8]
fake_survey_df[685,3] <- answer[9]
fake_survey_df[766,3] <- answer[10]

# for 40192443 #38 of 81
fake_survey_df[38,3] <- "Every day"
fake_survey_df[119,3] <- "I do not believe in God (or a higher power)"
fake_survey_df[200,3] <- "Many times a day"
fake_survey_df[281,3] <- "Most days"
fake_survey_df[362,3] <- "Never or almost never"
fake_survey_df[443,3] <- "Once in a while"
fake_survey_df[524,3] <- "Some days"
fake_survey_df[605,3] <- "Once in a while"
fake_survey_df[686,3] <- "Some days"
fake_survey_df[767,3] <- "Never or almost never"

# for 40192445 #39 of 81
fake_survey_df[39,3] <- "Almost never"
fake_survey_df[120,3] <- "Never"
fake_survey_df[201,3] <- "Fairly often"
fake_survey_df[282,3] <- "Sometimes"
fake_survey_df[363,3] <- "Very often"
fake_survey_df[444,3] <- "Almost never"
fake_survey_df[525,3] <- "Never"
fake_survey_df[606,3] <- "Fairly often"
fake_survey_df[687,3] <- "Sometimes"
fake_survey_df[768,3] <- "Very often"

# for 40192446 #40 of 81
fake_survey_df[40,3] <- "A little of the time"
fake_survey_df[121,3] <- "All of the time"
fake_survey_df[202,3] <- "Most of the time"
fake_survey_df[283,3] <- "None of the time"
fake_survey_df[364,3] <- "Some of the time"
fake_survey_df[445,3] <- "A little of the time"
fake_survey_df[526,3] <- "All of the time"
fake_survey_df[607,3] <- "Most of the time"
fake_survey_df[688,3] <- "None of the time"
fake_survey_df[769,3] <- "Some of the time"

# for 40192449 #41 of 81
fake_survey_df[41,3] <- "Almost never"
fake_survey_df[122,3] <- "Never"
fake_survey_df[203,3] <- "Fairly often"
fake_survey_df[284,3] <- "Sometimes"
fake_survey_df[365,3] <- "Very often"
fake_survey_df[446,3] <- "Almost never"
fake_survey_df[527,3] <- "Never"
fake_survey_df[608,3] <- "Fairly often"
fake_survey_df[689,3] <- "Sometimes"
fake_survey_df[770,3] <- "Very often"

# for 40192451 #42 of 81
fake_survey_df[42,3] <- "A few times a month"
fake_survey_df[123,3] <- "A few times a year"
fake_survey_df[204,3] <- "Almost everyday"
fake_survey_df[285,3] <- "Never"
fake_survey_df[366,3] <- "At least once a week"
fake_survey_df[447,3] <- "Less than once a year"
fake_survey_df[528,3] <- "A few times a month"
fake_survey_df[609,3] <- "A few times a year"
fake_survey_df[690,3] <- "Almost everyday"
fake_survey_df[771,3] <- "Never"

# for 40192452 #43 of 81
fake_survey_df[43,3] <- "Almost Never"
fake_survey_df[124,3] <- "Never"
fake_survey_df[205,3] <- "Fairly Often"
fake_survey_df[286,3] <- "Sometimes"
fake_survey_df[367,3] <- "Very Often"
fake_survey_df[448,3] <- "Almost Never"
fake_survey_df[529,3] <- "Never"
fake_survey_df[610,3] <- "Fairly Often"
fake_survey_df[691,3] <- "Sometimes"
fake_survey_df[772,3] <- "Very Often"

# for 40192456 #44 of 81 - nothing to do
# for 40192457 #45 of 81 - nothing to do
# for 40192458 #46 of 81 -
fake_survey_df[46,3] <- "Apartments or condos of 4-12 stories"
fake_survey_df[127,3] <- "Apartments or condos of more than 12 stories"
fake_survey_df[208,3] <- "Detached single-family housing"
fake_survey_df[289,3] <- "Mix of single-family residences and townhouses"
fake_survey_df[370,3] <- "Townhouses"
fake_survey_df[451,3] <- "Apartments or condos of 4-12 stories"
fake_survey_df[532,3] <- "Apartments or condos of more than 12 stories"
fake_survey_df[613,3] <- "Detached single-family housing"
fake_survey_df[694,3] <- "Mix of single-family residences and townhouses"
fake_survey_df[775,3] <- "Townhouses"

# for 40192462 #47 of 81
fake_survey_df[47,3] <- "Almost never"
fake_survey_df[128,3] <- "Never"
fake_survey_df[209,3] <- "Fairly often"
fake_survey_df[290,3] <- "Sometimes"
fake_survey_df[371,3] <- "Very often"
fake_survey_df[452,3] <- "Almost never"
fake_survey_df[533,3] <- "Never"
fake_survey_df[614,3] <- "Fairly often"
fake_survey_df[695,3] <- "Sometimes"
fake_survey_df[776,3] <- "Very often"

# for 40192463 #48 of 81
fake_survey_df[48,3] <- "Agree"
fake_survey_df[129,3] <- "Disagree"
fake_survey_df[210,3] <- "Neutral (neither agree nor disagree)"
fake_survey_df[291,3] <- "Strongly Agree"
fake_survey_df[372,3] <- "Strongly Disagree"
fake_survey_df[453,3] <- "Agree"
fake_survey_df[534,3] <- "Disagree"
fake_survey_df[615,3] <- "Neutral (neither agree nor disagree)"
fake_survey_df[696,3] <- "Strongly Agree"
fake_survey_df[777,3] <- "Strongly Disagree"

# for 40192466 #49 of 81
fake_survey_df[49,3] <- "A few times a month"
fake_survey_df[130,3] <- "A few times a year"
fake_survey_df[211,3] <- "Almost everyday"
fake_survey_df[292,3] <- "Never"
fake_survey_df[373,3] <- "At least once a week"
fake_survey_df[454,3] <- "Less than once a year"
fake_survey_df[535,3] <- "A few times a month"
fake_survey_df[616,3] <- "A few times a year"
fake_survey_df[697,3] <- "Almost everyday"
fake_survey_df[778,3] <- "Never"

# for 40192469 #50 of 81 - nothing to do
# for 40192470 #51 of 81
fake_survey_df[51,3] <- "1 to 3 times a month"
fake_survey_df[132,3] <- "I am not religious"
fake_survey_df[213,3] <- "Less than once per month"
fake_survey_df[294,3] <- "More than once a week"
fake_survey_df[375,3] <- "Never or almost never"
fake_survey_df[456,3] <- "Once a week"
fake_survey_df[537,3] <- "PMI: Skip"
fake_survey_df[618,3] <- "1 to 3 times a month"
fake_survey_df[699,3] <- "I am not religious"
fake_survey_df[780,3] <- "Less than once per month"

# for 40192471 #52 of 81
fake_survey_df[52,3] <- "Every day"
fake_survey_df[133,3] <- "I do not believe in God (or a higher power)"
fake_survey_df[214,3] <- "Many times a day"
fake_survey_df[295,3] <- "Most days"
fake_survey_df[376,3] <- "Never or almost never"
fake_survey_df[457,3] <- "Once in a while"
fake_survey_df[538,3] <- "Some days"
fake_survey_df[619,3] <- "Every day"
fake_survey_df[700,3] <- "I do not believe in God (or a higher power)"
fake_survey_df[781,3] <- "Many times a day"

# for 40192475 #53 of 81
fake_survey_df[53,3] <- "Every day"
fake_survey_df[134,3] <- "I am not religious"
fake_survey_df[215,3] <- "Many times a day"
fake_survey_df[296,3] <- "Most days"
fake_survey_df[377,3] <- "Never or almost never"
fake_survey_df[458,3] <- "Once in a while"
fake_survey_df[539,3] <- "Some days"
fake_survey_df[620,3] <- "Every day"
fake_survey_df[701,3] <- "I am not religious"
fake_survey_df[782,3] <- "Many times a day"

# for 40192476 #54 of 81 - nothing to do
# for 40192480 #55 of 81
fake_survey_df[55,3] <- "A little of the time"
fake_survey_df[136,3] <- "Most of the time"
fake_survey_df[217,3] <- "Some of the time"
fake_survey_df[298,3] <- "All of the time"
fake_survey_df[379,3] <- "None of the time"
fake_survey_df[460,3] <- "A little of the time"
fake_survey_df[541,3] <- "Most of the time"
fake_survey_df[622,3] <- "Some of the time"
fake_survey_df[703,3] <- "All of the time"
fake_survey_df[784,3] <- "None of the time"

# for 40192489 #56 of 81
fake_survey_df[56,3] <- "A few times a month"
fake_survey_df[137,3] <- "A few times a year"
fake_survey_df[218,3] <- "Almost everyday"
fake_survey_df[299,3] <- "Never"
fake_survey_df[380,3] <- "At least once a week"
fake_survey_df[461,3] <- "Less than once a year"
fake_survey_df[542,3] <- "A few times a month"
fake_survey_df[623,3] <- "A few times a year"
fake_survey_df[704,3] <- "Almost everyday"
fake_survey_df[785,3] <- "Never"

# for 40192490 #57 of 81
fake_survey_df[57,3] <- "A few times a month"
fake_survey_df[138,3] <- "A few times a year"
fake_survey_df[219,3] <- "Almost everyday"
fake_survey_df[300,3] <- "Never"
fake_survey_df[381,3] <- "At least once a week"
fake_survey_df[462,3] <- "Less than once a year"
fake_survey_df[543,3] <- "A few times a month"
fake_survey_df[624,3] <- "A few times a year"
fake_survey_df[705,3] <- "Almost everyday"
fake_survey_df[786,3] <- "Never"

# for 40192491 #58 of 81
fake_survey_df[58,3] <- "Almost Never"
fake_survey_df[139,3] <- "Never"
fake_survey_df[220,3] <- "Fairly Often"
fake_survey_df[301,3] <- "Sometimes"
fake_survey_df[382,3] <- "Very Often"
fake_survey_df[463,3] <- "Almost Never"
fake_survey_df[544,3] <- "Never"
fake_survey_df[625,3] <- "Fairly Often"
fake_survey_df[706,3] <- "Sometimes"
fake_survey_df[787,3] <- "Very Often"

# for 40192492 #59 of 81
fake_survey_df[59,3] <- "PMI: Skip"
fake_survey_df[140,3] <- "Somewhat Agree"
fake_survey_df[221,3] <- "Somewhat Disagree"
fake_survey_df[302,3] <- "Strongly Agree"
fake_survey_df[383,3] <- "Strongly Disagree"
fake_survey_df[464,3] <- "Strongly Disagree"
fake_survey_df[545,3] <- "Somewhat Agree"
fake_survey_df[626,3] <- "Somewhat Disagree"
fake_survey_df[707,3] <- "Strongly Agree"
fake_survey_df[788,3] <- "Strongly Disagree"

# for 40192493 #60 of 81 - nothing to do
# for 40192494 #61 of 81
fake_survey_df[61,3] <- "Never"
fake_survey_df[142,3] <- "Often"
fake_survey_df[223,3] <- "Rarely"
fake_survey_df[304,3] <- "Sometimes"
fake_survey_df[385,3] <- "Never"
fake_survey_df[466,3] <- "Often"
fake_survey_df[547,3] <- "Rarely"
fake_survey_df[628,3] <- "Sometimes"
fake_survey_df[709,3] <- "Never"
fake_survey_df[790,3] <- "Often"

# for 40192496 #62 of 81
fake_survey_df[62,3] <- "A few times a month"
fake_survey_df[143,3] <- "A few times a year"
fake_survey_df[224,3] <- "Almost everyday"
fake_survey_df[305,3] <- "Never"
fake_survey_df[386,3] <- "At least once a week"
fake_survey_df[467,3] <- "Less than once a year"
fake_survey_df[548,3] <- "A few times a month"
fake_survey_df[629,3] <- "A few times a year"
fake_survey_df[710,3] <- "Almost everyday"
fake_survey_df[791,3] <- "Never"

# for 40192497 #63 of 81
fake_survey_df[63,3] <- "Always"
fake_survey_df[144,3] <- "Never"
fake_survey_df[225,3] <- "Most of the time"
fake_survey_df[306,3] <- "Rarely"
fake_survey_df[387,3] <- "Sometimes"
fake_survey_df[468,3] <- "Always"
fake_survey_df[549,3] <- "Never"
fake_survey_df[630,3] <- "Most of the time"
fake_survey_df[711,3] <- "Rarely"
fake_survey_df[792,3] <- "Sometimes"

# for 40192498 #64 of 81
fake_survey_df[64,3] <- "Every day"
fake_survey_df[145,3] <- "I do not believe in God (or a higher power)"
fake_survey_df[226,3] <- "Many times a day"
fake_survey_df[307,3] <- "Most days"
fake_survey_df[388,3] <- "Never or almost never"
fake_survey_df[469,3] <- "Once in a while"
fake_survey_df[550,3] <- "Some days"
fake_survey_df[631,3] <- "I do not believe in God (or a higher power)"
fake_survey_df[712,3] <- "Many times a day"
fake_survey_df[793,3] <- "Most days"

# for 40192499 #65 of 81 - mostly ok - add neutrals
fake_survey_df[65,3] <- "Neutral (neither agree nor disagree)"
fake_survey_df[146,3] <- "Neutral (neither agree nor disagree)"
fake_survey_df[227,3] <- "Strongly Agree"

# for 40192500 #66 of 81 - nothing to do

# for 40192501 #67 of 81
fake_survey_df[67,3] <- "Never"
fake_survey_df[148,3] <- "Often"
fake_survey_df[229,3] <- "Rarely"
fake_survey_df[310,3] <- "Sometimes"
fake_survey_df[391,3] <- "Never"
fake_survey_df[472,3] <- "Often"
fake_survey_df[553,3] <- "Rarely"
fake_survey_df[634,3] <- "Sometimes"
fake_survey_df[715,3] <- "Never"
fake_survey_df[796,3] <- "Often"

# for 40192503 #68 of 81
fake_survey_df[68,3] <- "Always"
fake_survey_df[149,3] <- "Never"
fake_survey_df[230,3] <- "Most of the time"
fake_survey_df[311,3] <- "Rarely"
fake_survey_df[392,3] <- "Sometimes"
fake_survey_df[473,3] <- "Always"
fake_survey_df[554,3] <- "Never"
fake_survey_df[635,3] <- "Most of the time"
fake_survey_df[716,3] <- "Rarely"
fake_survey_df[797,3] <- "Sometimes"

# for 40192504 #69 of 81
fake_survey_df[69,3] <- "Never"
fake_survey_df[150,3] <- "Often"
fake_survey_df[231,3] <- "Rarely"
fake_survey_df[312,3] <- "Sometimes"
fake_survey_df[393,3] <- "Never"
fake_survey_df[474,3] <- "Often"
fake_survey_df[555,3] <- "Rarely"
fake_survey_df[636,3] <- "Sometimes"
fake_survey_df[717,3] <- "Never"
fake_survey_df[798,3] <- "Often"

# for 40192505 #70 of 81
fake_survey_df[70,3] <- "Never"
fake_survey_df[151,3] <- "Most of the time"
fake_survey_df[232,3] <- "Rarely"
fake_survey_df[313,3] <- "Sometimes"
fake_survey_df[394,3] <- "Always"
fake_survey_df[475,3] <- "Most of the time"
fake_survey_df[556,3] <- "Rarely"
fake_survey_df[637,3] <- "Sometimes"
fake_survey_df[718,3] <- "Never"
fake_survey_df[799,3] <- "Always"

# for 40192506 #71 of 81
fake_survey_df[71,3] <- "Almost Never"
fake_survey_df[152,3] <- "Fairly Often"
fake_survey_df[233,3] <- "Never"
fake_survey_df[314,3] <- "Sometimes"
fake_survey_df[395,3] <- "Very Often"
fake_survey_df[476,3] <- "Almost Never"
fake_survey_df[557,3] <- "Fairly Often"
fake_survey_df[638,3] <- "Never"
fake_survey_df[719,3] <- "Sometimes"
fake_survey_df[800,3] <- "Very Often"

# for 40192507 #72 of 81
fake_survey_df[72,3] <- "Never"
fake_survey_df[153,3] <- "Often"
fake_survey_df[234,3] <- "Rarely"
fake_survey_df[315,3] <- "Sometimes"
fake_survey_df[396,3] <- "Never"
fake_survey_df[477,3] <- "Often"
fake_survey_df[558,3] <- "Rarely"
fake_survey_df[639,3] <- "Sometimes"
fake_survey_df[720,3] <- "Never"
fake_survey_df[801,3] <- "Often"

# for 40192511 #73 of 81
fake_survey_df[73,3] <- "A little of the time"
fake_survey_df[154,3] <- "Most of the time"
fake_survey_df[235,3] <- "None of the time"
fake_survey_df[316,3] <- "Some of the time"
fake_survey_df[397,3] <- "All of the time"
fake_survey_df[478,3] <- "A little of the time"
fake_survey_df[559,3] <- "Most of the time"
fake_survey_df[640,3] <- "None of the time"
fake_survey_df[721,3] <- "Some of the time"
fake_survey_df[802,3] <- "All of the time"

# for 40192516 #74 of 81
fake_survey_df[74,3] <- "Never"
fake_survey_df[155,3] <- "Often"
fake_survey_df[236,3] <- "Rarely"
fake_survey_df[317,3] <- "Sometimes"
fake_survey_df[398,3] <- "Never"
fake_survey_df[479,3] <- "Often"
fake_survey_df[560,3] <- "Rarely"
fake_survey_df[641,3] <- "Sometimes"
fake_survey_df[722,3] <- "Never"
fake_survey_df[803,3] <- "Often"

# for 40192517 #75 of 81
fake_survey_df[75,3] <- "Never true"
fake_survey_df[156,3] <- "Often true"
fake_survey_df[237,3] <- "Sometimes true"
fake_survey_df[318,3] <- "Never true"
fake_survey_df[399,3] <- "Often true"
fake_survey_df[480,3] <- "Sometimes true"
fake_survey_df[561,3] <- "Never true"
fake_survey_df[642,3] <- "Often true"
fake_survey_df[723,3] <- "Sometimes true"
fake_survey_df[804,3] <- "Never true"

# for 40192519 #76 of 81
fake_survey_df[76,3] <- "A few times a month"
fake_survey_df[157,3] <- "A few times a year"
fake_survey_df[238,3] <- "Almost everyday"
fake_survey_df[319,3] <- "At least once a week"
fake_survey_df[400,3] <- "Less than once a year"
fake_survey_df[481,3] <- "Never"
fake_survey_df[562,3] <- "A few times a month"
fake_survey_df[643,3] <- "A few times a year"
fake_survey_df[724,3] <- "Almost everyday"
fake_survey_df[805,3] <- "At least once a week"

# for 40192522 #77 of 81 - nothing to do
# for 40192525 #78 of 81
fake_survey_df[78,3] <- "Almost Never"
fake_survey_df[159,3] <- "Fairly Often"
fake_survey_df[240,3] <- "Never"
fake_survey_df[321,3] <- "Sometimes"
fake_survey_df[402,3] <- "Very Often"
fake_survey_df[483,3] <- "Almost Never"
fake_survey_df[564,3] <- "Fairly Often"
fake_survey_df[645,3] <- "Never"
fake_survey_df[726,3] <- "Sometimes"
fake_survey_df[807,3] <- "Very Often"

# for 40192526 #79 of 81
fake_survey_df[79,3] <- "No"
fake_survey_df[160,3] <- "Yes"
fake_survey_df[241,3] <- "No"
fake_survey_df[322,3] <- "Yes"
fake_survey_df[403,3] <- "No"
fake_survey_df[484,3] <- "Yes"
fake_survey_df[565,3] <- "No"
fake_survey_df[646,3] <- "PMI: Prefer Not To Answer"
fake_survey_df[727,3] <- "Yes"
fake_survey_df[808,3] <- "No"

# for 40192528 #80 of 81
fake_survey_df[80,3] <- "A little of the time"
fake_survey_df[161,3] <- "Most of the time"
fake_survey_df[242,3] <- "None of the time"
fake_survey_df[323,3] <- "Some of the time"
fake_survey_df[404,3] <- "All of the time"
fake_survey_df[485,3] <- "A little of the time"
fake_survey_df[566,3] <- "Most of the time"
fake_survey_df[647,3] <- "None of the time"
fake_survey_df[728,3] <- "Some of the time"
fake_survey_df[809,3] <- "All of the time"

# for 40192529 #81 of 81
fake_survey_df[81,3] <- "Not at all"
fake_survey_df[162,3] <- "Not well"
fake_survey_df[243,3] <- "Very well"
fake_survey_df[324,3] <- "Well"
fake_survey_df[405,3] <- "Not at all"
fake_survey_df[486,3] <- "Not well"
fake_survey_df[567,3] <- "Very well"
fake_survey_df[648,3] <- "PMI: Prefer Not To Answer"
fake_survey_df[729,3] <- "PMI: Dont Know"
fake_survey_df[810,3] <- "PMI: Skip"

#
usethis::use_data(fake_survey_df, overwrite = TRUE)

