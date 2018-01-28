# Laskee tietyn jakopisteen log-uskottavuuden.

source("frekvenssit.R")

jaon_uskottavuus <- function (sanat, jakopiste) {

  fr1 <- frekvenssit(sanat[1:jakopiste])
  N1 <- jakopiste
  fr2 <- frekvenssit(sanat[(jakopiste+1):(length(sanat))])
  N2 <- length(sanat) - jakopiste
  ln_usk1 <- sum(vapply(
                      sanat[1:jakopiste],
                      function (tt) sum(log(as.numeric(fr1[fr1[,1]==tt,2]))),
                      numeric(1))
                 ) - N1 * log(N1) # nimittäjät vielä
  # Uskottavuus on tulo kunkin havaitun sanan empriinen todennäköisyydestä.
  # sum(log(as.numeric(fr1[fr1[,1]==tt,2]))) log-uskottavuus on summa frekvenssien logaritmeista, fr1[fr1[,1]==tt,2] on sanan tt frekvenssi jaon 1. osassa.
  # nimittäjät: - N1 * log(N1)
  
  ln_usk2 <- sum(vapply(
                      sanat[(jakopiste+1):(length(sanat))], 
                      function (tt) log(as.numeric(fr2[fr2[,1]==tt,2])),
                      numeric(1))
                ) - N2 * log(N2)
  return (ln_usk1 + ln_usk2)
}
