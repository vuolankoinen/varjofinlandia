teksti <- read.csv("data")
teksti <- as.vector(teksti$X1)

source(file="frekvenssit.R")

frekv <- table(teksti)
frekv <- cbind(2:(nrow(frekv)+1), frekv)

# Vain kerran käytetyt sanat omaksi luokakseen.
yksit <- as.vector(frekv[frekv[,2]==1,1])
teksti[teksti %in% yksit] <- 0

frekv <- cbind(c(0,as.vector(frekv[frekv[,2]>1,1])), table(teksti))

source("jaon_uskottavuus.R")
source("jakopisteet.R")

# jaot500 <- jakopisteet(teksti, 500) # Puolisen minuuttia

#jaot50 <- jakopisteet(teksti, 50) # 4½ minuuttia
#save(jaot50, file="jaot50.Rdat")
load("jaot50.Rdat")

png("jaot50.png")
plot(seq(50,length(teksti)-1,by=50), jaot50)
dev.off()

source("erotus_keskiarvosta.R")
erot50 <- erotus_keskiarvosta(jaot50, 2)

png("jakojen_erot50.png")
plot(seq(50,length(teksti)-1,by=50), erot50)
dev.off()

source("jaon_normalisoitu_uskottavuus.R")

#jaot50mod <- jakopisteet(teksti, 50, 1) # 5 min

#  save(jaot50mod, file="jaot50mod.Rdat")
load("jaot50mod.Rdat")

png("jaot50normalisoitu.png")
plot(seq(50,length(teksti)-1,by=50), jaot50mod)
dev.off()
