setosa_subs <-data.frame(iris)
setosa_subs

#Setosa Subset

setosa_subs <-subset(iris, Species == 'setosa')
setosa_subs

#Total Mean of Setosa Species

setosa_mean <- mean(colMeans(setosa_subs[,1:4]))
setosa_mean

#Mean of each characteristics of the species

setosa_charac <- colMeans(setosa_subs[,1:4])
setosa_charac

# Sepal.Length
setosa_sl <- c(setosa_subs$Sepal.Length)
mean(setosa_sl)

# Sepal.Width
setosa_sw <- c(setosa_subs$Sepal.Width)
mean(setosa_sw)

# Petal.Length
setosa_pl <- (setosa_subs$Petal.Length)
mean(setosa_pl)

# Petal.Width 
setosa_pw <- c(setosa_subs$Petal.Width)
mean(setosa_pw)