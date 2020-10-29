#### Start of Harv Twitter
library(tidyverse)
library(rtweet)
library(httpuv)
library(gtrendsR)
library(lubridate)
library(maps)
library(pals)
library(viridis)
library(scico)
library(ggrepel)
library(tidytext)
data("stop_words")

app_name <- "harvard-twitter"
api_key <- "lageuRomZNzkJA81MZ4XVtoxs"
api_secret_key <- "zPexiuiBDQ6z6OyrnHW93PlIjrR3PhBm1Jo7lq42J4A1Zne7vV"
token <- create_token(
  app = "harvard-twitter",
  consumer_key = api_key,
  consumer_secret = api_secret_key)

path_to_token <- file.path(path.expand("~"), ".twitter_token.rds")
saveRDS(token, path_to_token)
env_var <- paste0("TWITTER_PAT=", path_to_token)
cat(env_var, file = file.path(path.expand("~"), ".Renviron"), 
    fill = TRUE, append = TRUE)

readRenviron("~/.Renviron")

usa <- lookup_coords(address = "usa", apikey = "88a679312c139a94aa3d3210ef78e8a8e1a925f6")

harvard <- search_tweets("harvard", n = 10000, include_rts = FALSE)

save_as_csv(harvard, "harvard_general.csv")

H_tml <- get_timeline("Harvard", n = 3200)

save_as_csv(H_tml, "harvard_tml.csv")
