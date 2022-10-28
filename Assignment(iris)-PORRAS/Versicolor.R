versicolor_subs <-data.frame(iris)
versicolor_subs

#Versicolor Subset

versicolor_subs <- subset(iris, Species == 'versicolor')
versicolor_subs

#Total Mean of Versicolor Species

versicolor_mean <- mean(colMeans(versicolor_subs[,1:4]))
versicolor_mean

#Mean of each characteristics of the species

versicolor_charac <- colMeans(versicolor_subs[,1:4])
versicolor_charac

# Sepal.Length
versicolor_sl <- c(versicolor_subs$Sepal.Length)
mean(versicolor_sl)

# Sepal.Width
versicolor_sw <- c(versicolor_subs$Sepal.Width)
mean(versicolor_sw)

# Petal.Length
versicolor_pl <- (versicolor_subs$Petal.Length)
mean(versicolor_pl)

# Petal.Width 
versicolor_pw <- c(versicolor_subs$Petal.Width)
mean(versicolor_pw)