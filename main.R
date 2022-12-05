# Membaca Daftar Surat dan Ayat
df <- read.csv("data/forsampling.csv")

# Inisiasi nilai agar while loop berjalan
n <- 300

while ( n > 280) (
  k <- sample(1:6236,1)
  
  id_file <- paste0("translations/id/", df$surah[k], "/", df$ayah[k], ".txt" )
  id_text <- readChar(id_file, file.info(id_file)$size)
  
  ar_file <- paste0("surah/", df$surah[k], "/", df$ayah[k], ".txt" )
  ar_text <- readChar(ar_file, file.info(ar_file)$size)
  
  status_details <- paste0(ar_text,
                           "\n",
                           "\n",
                           id_text, " (", df$surah[k], ":",df$ayah[k], ")"
                          )
  n <- nchar(status_details)
)

library(rtweet)

token_rm <- rtweet_bot(
  api_key =    Sys.getenv("TWITTER_CONSUMER_API_KEY"),
  api_secret = Sys.getenv("TWITTER_CONSUMER_API_SECRET"),
  access_token =    Sys.getenv("TWITTER_ACCESS_TOKEN"),
  access_secret =   Sys.getenv("TWITTER_ACCESS_TOKEN_SECRET")
  )

post_tweet(
  status = status_details,
  token = token_rm               
)
