# Laskee sanalistan mahdollisten kahtiajakopisteiden uskottavuudet. Parametreina sanalista, sanojen frekvenssit ja tutkittavien jakopisteiden taajuus.
# modattu = 0 -> uskottavuus, modattu = 1 -> normalisoitu uskottavuus

source("jaon_uskottavuus.R")
source("jaon_normalisoitu_uskottavuus.R")

jakopisteet <- function(sanalista, osakoko=1, modattu=0) {
    tulos <- c()
    if (modattu==0){
        for (tt in seq(osakoko,length(sanalista)-1,by=osakoko)) {
            tulos <-    c(tulos, jaon_uskottavuus(sanalista, tt))
        }
    } else {
        for (tt in seq(osakoko,length(sanalista)-1,by=osakoko)) {
            tulos <-    c(tulos, jaon_normalisoitu_uskottavuus(sanalista, tt))
            cat(tt, "\n")
        }
    }
    return(tulos)
}
