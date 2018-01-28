# Laskee tietyn jakopisteen log-uskottavuuden säädettynä.

source("frekvenssit.R")

jaon_normalisoitu_uskottavuus <- function (sanat, jakopiste) {
  fr1 <- frekvenssit(sanat[1:jakopiste])
  N1 <- jakopiste
  fr2 <- frekvenssit(sanat[(jakopiste+1):(length(sanat))])
  N2 <- length(sanat) - jakopiste
  
  ln_usk1 <- sum(vapply(sanat[1:jakopiste],
                        function (tt) log(as.numeric(fr1[fr1[,1]==tt,2])),
                        numeric(1)))
  summa <- sum(vapply(sanat[1:jakopiste],
                      function (tt) as.numeric(fr1[fr1[,1]==tt,2]),
                      numeric(1)))
    ## nimittäjät: - N1 * log(N1)
    ## Normalisointi: jaetaan uskottavuuden jokainen empiirinen todennäköisyys keskimääräisellä empiirisellä todennäköisyydellä, eli: N1*( 2*log(N1) - log(summa) )
    ## Yhdessä siis
  ln_usk1 <- ln_usk1 +N1*log(N1) - N1*log(summa)
    
  ln_usk2 <- sum(vapply(sanat[(jakopiste+1):(length(sanat))],
                        function (tt) log(as.numeric(fr2[fr2[,1]==tt,2])), # Uskottavuus on tulo kunkin havaitun sanan empriisestä todennäköisyydestä.
                        numeric(1)))
  summa <- sum(vapply(sanat[(jakopiste+1):(length(sanat))],
                      function (tt) as.numeric(fr2[fr2[,1]==tt,2]),
                      numeric(1)))
  ln_usk2 <- ln_usk2 +N2*log(N2) - N2*log(summa)
  
  return (ln_usk1 + ln_usk2) # Palauttaa ln_-uskottavuuden
}
