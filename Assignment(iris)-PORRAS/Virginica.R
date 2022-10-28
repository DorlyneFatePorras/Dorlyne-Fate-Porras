virginica_subs <-data.frame(iris)
virginica_subs

#Virginica Subset

virginica_subs <-subset(iris, Species == 'virginica')
virginica_subs

#Total Mean of Virginica Species

virginica_mean <- mean(colMeans(virginica_subs[,1:4]))
virginica_mean

#Mean of each characteristics of the species

virginica_charac <- colMeans(virginica_subs[,1:4])
virginica_charac

# Sepal.Length
virginica_sl <- c(virginica_subs$Sepal.Length)
mean(virginica_sl)

# Sepal.Width
virginica_sw <- c(virginica_subs$Sepal.Width)
mean(virginica_sw)

# Petal.Length
virginica_pl <- (virginica_subs$Petal.Length)
mean(virginica_pl)

# Petal.Width 
virginica_pw <- c(virginica_subs$Petal.Width)
mean(virginica_pw)