# Laskee sanalistan mahdollisten kahtiajakopisteiden uskottavuudet. Parametreina sanalista, sanojen frekvenssit ja tutkittavien jakopisteiden taajuus.
# modattu = 0 -> uskottavuus, modattu = 1 -> normalisoitu uskottavuus
# rajat antaa aloitus- ja lopetusindeksit: rajat=c(alku, loppu)

source("jaon_uskottavuus.R")
source("jaon_normalisoitu_uskottavuus.R")

jakopisteet <- function(sanalista, osakoko=1, modattu=0, rajat=c(0)) {
  if (length(rajat)!=2) {
    rajat <- c(osakoko, length(sanalista))
  }
  indeksit <- seq(rajat[1],rajat[2]-1,by=osakoko)
  if (modattu == 0) {
    tulos <- vapply(indeksit, 
                    function (tt) jaon_uskottavuus(sanalista, tt),
                    numeric(1))
  } else {
    tulos <- vapply(indeksit, 
                    function (tt) jaon_normalisoitu_uskottavuus(sanalista, tt),
                    numeric(1))  
  }
  return(tulos)
}
