1. Create a data frame using the table below.

a. Write the codes.

Respondents <- c(seq(1,20))
Sex <- c(2,2,1,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,1,2)
FathersOccupation <- c(1,3,3,3,1,2,3,1,1,1,3,2,1,3,3,1,3,1,2,1)
Personsathome <- c(5,7,3,8,5,9,6,7,8,4,7,5,4,7,8,8,3,11,7,6) 
Siblingsatschool <- c(6,4,4,1,2,1,5,3,1,2,3,2,5,5,2,1,2,5,3,2)
Typesofhouses <- c(1,2,3,1,1,3,3,1,2,3,2,3,2,2,3,3,3,3,3,2)

dataf <- data.frame(Respondents,Sex,FathersOccupation,Personsathome,
                     Siblingsatschool,Typesofhouses)


b. Describe the data. Get the structure or the summary of the data

summary(dataf)

c. Is the mean number of siblings attending is 5?

mean(Siblingsatschool)

Answer: NO

d. Extract the 1st two rows and then all the columns using the subsetting functions.
Write the codes and its output.

rows2 <- subset(dataf[c(3,5),c(2,4)])
rows2


e. Extract 3rd and 5th row with 2nd and 4th column. Write the codes and its
result.

rows3 <- subset(dataf[c(3,5),c(2,4)])
rows3

f. Select the variable types of houses then store the vector that results as types_houses.
Write the codes.

rows4 <- dataf[c(6)]

type_houses <- rows4

g. Select only all Males respondent that their father occupation was farmer. Write
the codes and its output.

Males <- subset(dataf[c(3,11),c(2,3)])
Males

h. Select only all females respondent that have greater than or equal to 5 number
of siblings attending school. Write the codes and its outputs.

rows5 <- subset(dataf[c(1:20), c(2,5)])
Female <- rows5[dataf$Siblingsatschool >= 5,]
Female

2. Write a R program to create an empty data frame. Using the following codes:
  df = data.frame(Ints=integer(),
                  Doubles=double(), Characters=character(),
                  Logicals=logical(),
                  Factors=factor(),
                  stringsAsFactors=FALSE)
print("Structure of the empty dataframe:")
print(str(df))
a. Describe the results.
 The result is the print of Structure of the empty dataframe is printed. The data.frame
 have 0 object but have a 5 variables. The variables are Ints or int, Doubles or num,
 Characters that is chr, Logicals or logi and Factors w/0 levels and the result is NULL.
 



3. Interpret the graph.
 The graph is all about The Sentiments Tweets per Day - Donal Trumph. 
 In the graph there have a three sentiments, the Negative- The red one, the Neutral- The
 yellow, and lastly, the Positive- The bulue one. So the graph shows the tweet per day
 It starts in July 14,2000 to July 21, 2000. The graph shows that the day July 15 and 21
 have the more positive in that day.


  
  