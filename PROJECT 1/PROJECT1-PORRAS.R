#Install Library
install.packages("twitteR")
install.packages("tm")
install.packages("dplyr")
install.packages("tidyr")
install.packages("plotly")
install.packages("ggplot2")
install.packages("RColorBrewer")
install.packages("tidytext")
install.packages("wordcloud")
install.packages("wordcloud2")





library(twitteR)
library(tm)
library(dplyr)
library(tidyr)
library(plotly)
library(ggplot2)
library(RColorBrewer)
library(tidytext)
library(wordcloud)
library(wordcloud2)

#setup credentials
setup_twitter_oauth(consumer_key = "GHKm9bZlG5ixCP9nSOlfkd4hr",
                    consumer_secret = "iNDfRPoUwA4f1GJJBhKNUxkxD6LD35CBIaMlrWZLq1SyXdl1pN",
                    access_token ="1595071636503691265-V82xQ6okdZwlp7O0LPLVTcSflzlech",
                    access_secret = "oDE4St7NurAVZ86fkplwjp7UtGVSxThxOs0LME49hW7KS")




trendTweets <- searchTwitter("#Wednesday -filter:retweets", n=10000, lang = "en",
                    since = NULL, until = NULL, retryOnRateLimit = 120)
trendTweets




#Convert data into dataframe and save file into R.data

trendDF <- twListToDF(trendTweets)
trendDF
class(trendDF)
names(trendDF)
View(trendDF)
head(trendDF)[1:5]
head(trendDF$text)[1:5]

save(trendDF, file = "trendDF.Rdata")
load(file = "trendDF.Rdata")



#Checking for missing values in a data frame

trendDF$text <- sapply(trendDF$text, function(x) iconv(enc2utf8(x), sub = "byte"))
head(trendDF$text)

sapply(trendDF, function(x) sum(is.na(x)))

chuchuDF <- trendDF %>%
  select(screenName,text,created,statusSource)
chuchuDF

#saving file as Rdata

save(chuchuDF, file = "chuchuDF.Rdata")
write.csv(chuchuDF, file = "chuchuDF.csv")


#Grouping Data created

chuchuDF%>%group_by(1) %>% summarise(max = max(created), min = min(created))

chuchuDF%>%mutate(Created_At_Round = created%>%round(units = 'hours')%>%as.POSIXct())

chuchuDF %>%pull(created) %>% min()
chuchuDF %>%pull(created) %>% max()



#plot

ggplot(data = chuchuDF, aes(x = created)) +
  geom_histogram(aes(fill = ..count..)) +
  theme(legend.position = "right") +
  xlab("Time") + ylab("Number of tweets") + 
  scale_fill_gradient(low = "purple", high = "pink")



#Analysis using the source


encodeSource <- function(x) {
  if(grepl(">Twitter for iPhone</a>", x)){
    "iphone"
  }else if(grepl(">Twitter for iPad</a>", x)){
    "ipad"
  }else if(grepl(">Twitter for Android</a>", x)){
    "android"
  } else if(grepl(">Twitter Web Client</a>", x)){
    "Web"
  } else if(grepl(">Twitter for Windows Phone</a>", x)){
    "windows phone"
  }else if(grepl(">dlvr.it</a>", x)){
    "dlvr.it"
  }else if(grepl(">IFTTT</a>", x)){
    "ifttt"
  }else if(grepl(">Facebook</a>", x)){ 
    
    "facebook"
  }else {
    "others"
  }
}


chuchuDF$tweetSource = sapply(chuchuDF$statusSource, encodeSource)

Source <- chuchuDF %>% 
  select(tweetSource) %>%
  group_by(tweetSource) %>%
  summarize(count=n()) %>%
  arrange(desc(count)) 








#plotting using geom_bar() - bar graph

ggplot(chuchuDF[chuchuDF$tweetSource != 'others',], aes(tweetSource, fill = tweetSource)) +
  geom_bar() +
  theme(legend.position="none",
        axis.title.x = element_blank(),
        axis.text.x = element_text(angle = 45, hjust = 1)) +
  ylab("Number of tweets") +
  ggtitle("Tweets by Source")



Screen <- chuchuDF %>%
  select(screenName) %>%
  group_by(screenName) %>%
  summarize(count=n()) %>%
  arrange(desc(count)) 






#convert to Corpus
Corpname <- Corpus(VectorSource(chuchuDF$screenName))  


#using ScreenName


class(chuchuDF$screenName)
str(Corpname)
class(Corpname)



#Create a wordcloud from the screenName

pal <- brewer.pal(8, "Dark2")
pal <- pal[-(1:4)]
set.seed(123)

par(mar = c(0,0,0,0), mfrow = c(1,1))

wordcloud(words = Corpname, scale=c(3,0.5),
          max.words=500,
          random.order=FALSE,
          rot.per=0.5,
          use.r.layout=TRUE,
          colors=pal)
