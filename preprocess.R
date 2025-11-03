library(tidyverse)
library(lubridate)
library(arrow)

#reddit_politics <- read_csv("politics.csv")

#reddit_pronouns <- reddit_politics %>%
#  filter(str_detect(body, regex("\\bhe\\b|\\bshe\\b", ignore_case = TRUE))) #%>%
  #mutate(year = year(ymd_hms(timestamp)))

#replace_terms_regex <- "\\bfuck\\b|\\bfucking\\b|\\bmotherfucker\\b|\\bshit\\b|\\bbitch\\b|\\bbastard\\b|\\basshole\\b|\\bdamn\\b|\\bhell\\b|\\bbullshit\\b|\\bdick\\b|\\bpussy\\b|\\bcock\\b|\\bslut\\b|\\bwhore\\b|\\bjerk\\b|\\bcunt\\b|\\bfaggot\\b|\\bfag\\b|\\bdyke\\b|\\btranny\\b|\\bqueer\\b|\\bnigger\\b|\\bnigga\\b|\\bchink\\b|\\bspic\\b|\\bwetback\\b|\\bkike\\b|\\bgook\\b|\\bredskin\\b|\\braghead\\b|\\bcracker\\b|\\bretard\\b|\\bretarded\\b|\\bspaz\\b|\\bdumb\\b|\\blame\\b|\\bcrazy\\b"
#replace_terms_regex <- "\\bfuck\\b|\\bfucking\\b"

#clean_reddit_pronouns <- reddit_pronouns %>%
#  filter(str_detect(body, regex(replace_terms_regex, ignore_case = TRUE)))

#clean_reddit_pronouns <- reddit_pronouns %>%
#  select(Subreddit, Text, `Political Lean`)

#write_csv(reddit_pronouns_selective, "reddit_sample.csv")

#reddit_worldnews <- read_parquet("")

a <- read_csv("reddit_politics.csv")

b <- a %>%
  filter(str_detect(body, regex("\\bhe\\b|\\bshe\\b", ignore_case = TRUE))) 

c <- b %>%
  mutate(body = str_replace_all(body, regex("fuck", ignore_case = TRUE), "fuzz"))

c <- c %>%
  mutate(body = str_replace_all(body, regex("rape", ignore_case = TRUE), "r"))


write_csv(c, "reddit_sample.csv")
