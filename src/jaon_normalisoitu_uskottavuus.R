# Laskee tietyn jakopisteen log-uskottavuuden säädettynä.

source("frekvenssit.R")

jaon_normalisoitu_uskottavuus <- function (sanat, jakopiste) {

    fr1 <- frekvenssit(sanat[1:jakopiste])

    N1 <- jakopiste

    fr2 <- frekvenssit(sanat[(jakopiste+1):(length(sanat))])

    N2 <- length(sanat) - jakopiste

    ln_usk1 <- 0
    summa <- 0 # normalisointia varten
    for (tt in sanat[1:jakopiste]) { # uskottavuus on tulo kunkin havaitun sanan empriinen todennäköisyydestä.
        # log-uskottavuus on summa frekvenssien logaritmeista.
        # Silmukka laskee 1. osan osoittajien logaritmien summan.

#        fr1[fr1[,1]==tt,2] # sanan tt frekvenssi jaon 1. osassa
       ln_usk1 <- ln_usk1 + log(as.numeric(fr1[fr1[,1]==tt,2]))
       summa <- summa + as.numeric(fr1[fr1[,1]==tt,2])
    }
    ## nimittäjät: - N1 * log(N1) 
    ## Normalisointi: jaetaan uskottavuuden jokainen empiirinen todennäköisyys keskimääräisellä empiirisellä todennäköisyydellä, eli: N1*( 2*log(N1) - log(summa) )
    ## Yhdessä siis
    ln_usk1 <- ln_usk1 +N1*log(N1) - N1*log(summa)

        ln_usk2 <- 0
    summa <- 0
    for (tt in sanat[(jakopiste+1):(length(sanat))]) { # uskottavuus on tulo kunkin havaitun sanan empriinen todennäköisyydestä.
        # log-uskottavuus on summa frekvenssien logaritmeista.
        # Silmukka laskee 2. osan osoittajien logaritmien summan.

#        fr1[fr1[,1]==tt,2] # sanan tt frekvenssi jaon 1. osassa
       ln_usk2 <- ln_usk2 + log(as.numeric(fr2[fr2[,1]==tt,2]))
       summa <- summa + as.numeric(fr2[fr2[,1]==tt,2])
    }
    ln_usk2 <- ln_usk2 +N2*log(N2) - N2*log(summa)

    return (ln_usk1 + ln_usk2) # Palauttaa ln_-uskottavuuden
}
