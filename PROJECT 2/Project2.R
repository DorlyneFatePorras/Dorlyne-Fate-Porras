Project 2- PORRAS

library(twitteR)

setup_twitter_oauth(consumer_secret = "eMmDQbSKuQklZOok7CHZLczv6J5v1ksUSt8hb1fsFUXiZJaE6x",
                    consumer_key = "kHQlsOWEfQceIctsnMTlpyaq2" ,
                    access_token =  "1595071636503691265-hQb44fWyYfNEdpytdlR6aluHoN5rbV",
                    access_secret = "jePVXH1YjiDqCaCGTMJ4kslXdwSZPsXyLqhHZ47zSpGJZ")

wtweets <- searchTwitter("Wednesday", 
                         n = 10000,
                         lang = "en",
                         since = NULL,
                         until = NULL,
                         retryOnRateLimit=120)


wtweets

#Covert Data to data frame. 
#Save and load data file

wtweetsDF<- twListToDF(wtweets)

save(wtweetsDF, file = "wtweetsDF.Rdata")
load(file = "wtweetsDF.Rdata")
wtweetsDF

#Checking for missing values in a data frame

missingValue <-sapply(wtweetsDF, function(x) sum(is.na(x)))

missingValue



#Subsetting using the dplyr()package
#Save and load the data file

ts<- wtweetsDF %>%
  select(screenName,text,created, isRetweet) %>% filter(isRetweet == FALSE)

ts



save(ts, file = "wtwts.Rdata")
load(file = "wtwts.Rdata")


#Grouping the date created

ts %>%  group_by(1) %>%  summarise(max = max(created), min = min(created))


#Getting the min and max

ts <- ts %>%  mutate(Created_At_Round = created %>% round
                     
                     (units = 'hours') %>%as.POSIXct())


mintwts <- ts %>% pull(created) %>% min()
mintwts

maxtwts <- ts %>% pull(created) %>% max()
maxtwts


#Using plotly() package and ggplot()


twtsPlot <- ggplot(ts, aes(x = Created_At_Round)) +
  geom_histogram(aes(fill = ..count..)) +theme(legend.position = "left") +
  xlab("Time") + ylab("Number of tweets") + 
  scale_fill_gradient() 

twtsPlot %>% ggplotly()



#Retweet Data

retwt <- wtweetsDF %>%
  select(screenName,text,created, isRetweet) %>% filter(isRetweet == TRUE)
retwt

#Grouping the data created in Retweet

retwt %>%  
  group_by(1) %>%  
  summarise(max = max(created), min = min(created))

#Getting min and max 



retwt1 <- retwt %>%  mutate(Created_At_Round = created %>% round
                            (units = 'hours') %>%as.POSIXct())


min_retwts <- retwt %>% pull(created) %>% min()
min_retwts

max_retwts <- retwt %>% pull(created) %>% max()
max_retwts



#Plotting Retweets Using plotly() package and ggplot()


retwtPlot <- ggplot(retwt1, aes(x = Created_At_Round)) +
  geom_histogram(aes(fill = ..count..)) +
  theme(legend.position = "left") +
  xlab("Time") + ylab("Number of tweets") + 
  scale_fill_gradient()

retwtPlot %>% ggplotly()


















