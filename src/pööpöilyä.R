harvuus <- 50

#
teksti <- c(rep(1,100),rep(2,3000), rep(3,1000))
source("jakopisteet.R")
jaot <- jakopisteet(teksti, harvuus,1)

png("poop1.png")
plot(seq(harvuus,length(teksti)-1,by=harvuus), jaot)
dev.off()

#
teksti <- c(rep(1,100),rep(c(1,2),3000), rep(2,1000))
source("jakopisteet.R")
jaot_1 <-jakopisteet(teksti, harvuus,0)
jaot_2 <- jakopisteet(teksti, harvuus,1)

png("poop2.png")
plot(seq(harvuus,length(teksti)-1,by=harvuus), jaot_1)
dev.off()
png("poop3.png")
plot(seq(harvuus,length(teksti)-1,by=harvuus), jaot_2)
dev.off()

#
teksti <- rep(c(1,2,3), 1000)
jaot_1 <- jakopisteet(teksti, harvuus,0)
jaot_2 <- jakopisteet(teksti, harvuus,1)

png("poop4.png")
plot(seq(harvuus,length(teksti)-1,by=harvuus), jaot_1)
dev.off()
png("poop5.png")
plot(seq(harvuus,length(teksti)-1,by=harvuus), jaot_2)
dev.off()

#
harvuus <- 1
teksti <- c(rep(2, 300), 1, rep(2,699))
jaot_1 <- jakopisteet(teksti, harvuus,0)
jaot_2 <- jakopisteet(teksti, harvuus,1)

png("poop7.png")
plot(seq(harvuus,length(teksti)-1,by=harvuus), jaot_1)
dev.off()
png("poop8.png")
plot(seq(harvuus,length(teksti)-1,by=harvuus), jaot_2)
dev.off()

#
teksti <- c(rep(2, 3), rep(1,697))

jaot_1 <- jakopisteet(teksti, harvuus,0)
jaot_2 <- jakopisteet(teksti, harvuus,1)
png("poop9.png")
plot(seq(harvuus,length(teksti)-1,by=harvuus), jaot_1)
dev.off()
png("poop10.png")
plot(seq(harvuus,length(teksti)-1,by=harvuus), jaot_2)
dev.off()

#
teksti <- c(sample(c(1,2,3,4),size=200, replace=TRUE), sample(c(1,2,5,6,7,8),size=400, replace=TRUE))
jaot_1 <- jakopisteet(teksti, harvuus,0)
jaot_2 <- jakopisteet(teksti, harvuus,1)
png("poop11.png")
plot(seq(harvuus,length(teksti)-1,by=harvuus), jaot_1)
dev.off()
png("poop12.png")
plot(seq(harvuus,length(teksti)-1,by=harvuus), jaot_2)
dev.off()

#
teksti <- c(sample(1:100,size=200, replace=TRUE), sample(1:100,prob=c(rep(3,20),rep(1,80)),size=400, replace=TRUE))
jaot_1 <- jakopisteet(teksti, harvuus,0)
jaot_2 <- jakopisteet(teksti, harvuus,1)
png("poop13c.png")
plot(seq(harvuus,length(teksti)-1,by=harvuus), jaot_1)
dev.off()
png("poop14c.png")
plot(seq(harvuus,length(teksti)-1,by=harvuus), jaot_2)
dev.off()
