teksti <- read.csv("data")
teksti <- as.vector(teksti$X1)


frekv <- table(teksti)
frekv <- cbind(2:(nrow(frekv)+1), frekv)

# Vain kerran käytetyt sanat omaksi luokakseen.
yksit <- as.vector(frekv[frekv[,2]==1,1])
teksti[teksti %in% yksit] <- 0
#frekv <- table(teksti)

frekv <- cbind(c(0,as.vector(frekv[frekv[,2]>1,1])), table(teksti))

#source("jakopisteet.R")








