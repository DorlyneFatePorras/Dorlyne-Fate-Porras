1. The table shows the enrollment of BS in Computer Science, SY 2010-2011

enrollment <- data.frame("Course Year" = c("1st","2nd","3rd","4th"),
                         "2019-2020" = c(80, 75, 70, 60))
enrollment

a. Plot the data using a bar graph. Write the codes and copy the result.

data <- c("1st" = 80, "2nd" = 75, "3rd" = 70, "4th" = 60)
data
barplot(data)


b. Using the same table, label the barchart with

Title = ” Enrollment of BS Computer Science
horizontal axis = “Curriculum Year” and
vertical axis = “number of students”

bar <- c("1st" = 80, "2nd" = 75, "3rd" = 70, "4th" = 60)
bar
barplot(bar, main = "Enrollment of BS Computer Science", xlab = "Number of Students", 
        ylab = "Curriculum Year")


2. The monthly income of De Jesus family was spent on the following: 60% on Food,
10% on electricity, 5% for savings, and 25% for other miscellaneous expenses.

a. Create a table for the above scenario. Write the codes and its result.

income_data <- data.frame(facts = c("Food", "Electricity", "Savings", 
                                    "MiscellaneousExpenses"), spent = c(60,10,5,25)
                                )
income_data

tableData <- table(income_data)
tableData


b. Plot the data using a pie chart. Add labels, colors and legend.
Write the codes and its result.

data_per <- round(spent/sum(spent) * 100, 1)
data_per <- paste(data_per,"%",sep = "")

data_pie <- pie(spent,
                main = "Month Data",
                col = rainbow(4),
                labels =  data_per, cex = 0.8
                data_pie
                
                legend(1.3,1.5, c("Food","Electricity","Savings","Miscellaneous expenses"),
                       cex = 0.8,fill = rainbow(4))
3. Open the mtcars dataset.
data("mtcars")

a. Create a simple histogram specifically for mpg (miles per gallon) variable.
Use $ to select the mpg only. Write the codes and its result.

data_mtcars <- (mtcars$mpg)
data_mtcars

hist(data_mtcars, breaks = 12)

b. Colored histogram with different number of bins.
hist(mtcars$mpg, breaks=12, col="red")

hist(mtcars_data, breaks = 12, col = "purple")

c. Add a Normal Curve
x <- mtcars$mpg
h<-hist(x, breaks=10, col="red", xlab="Miles Per Gallon",
        main="Histogram with Normal Curve")
xfit<-seq(min(x),max(x),length=40)
yfit<-dnorm(xfit,mean=mean(x),sd=sd(x))
yfit <- yfit*diff(h$mids[1:2])*length(x)
lines(xfit, yfit, col="blue", lwd=2)
Copy the result.

curve_data <- mtcars_data
curve_data


hist_data <- hist(curve_data, breaks = 10, col = "red",
                  xlab = "Miles Per Gallon", main = "Histogram with Normal Curve")

xfit<-seq(min(curve_data),max(curve_data),length=40)
yfit<-dnorm(xfit,mean=mean(curve_data),sd=sd(curve_data))
yfit <- yfit*diff(hist_data$mids[1:2])*length(curve_data)
lines(xfit, yfit, col="blue", lwd=2)

hist_data

4. Open the iris dataset. Create a subset for each species.

a. Write the codes and its result.

data("iris")

iris_data <- data.frame(iris)
iris_data

data_setosa <- subset(iris_data, Species == 'setosa' )
data_setosa

data_versicolor <- subset(iris_data, Species == 'versicolor' )
data_versicolor

data_virginica <- subset(iris_data, Species == 'virginica' )
data_virginica

b. Get the mean for every characteristics of each species using colMeans().

Write the codes and its result.

Example: setosa <- colMeans(setosa[sapply(setosaDF,is.numeric)])

data_setosa <- colMeans(data_setosa[sapply(data_setosa,is.numeric)])
data_setosa

data_versicolor <- colMeans(data_versicolor[sapply(data_versicolor,is.numeric)])
data_versicolor

data_virginica <- colMeans(data_virginica[sapply(data_virginica,is.numeric)])
data_virginica

c. Combine all species by using rbind()
The table should be look like this:
  
combine <- rbind(data_setosa,data_versicolor,data_virginica)
iris <- data.frame(combine)
iris


d. From the data in 4-c: Create the barplot().
Write the codes and its result.
The barplot should be like this.

barplot(height = as.matrix(iris),
        main = "Iris Data",
        ylab = "Mean Scores",
        xlab = "Characteristics",
        beside = T, col = rainbow(3)
        )

  

