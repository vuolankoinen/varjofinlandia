# Laskee tietyn jakopisteen log-uskottavuuden.

jaon_uskottavuus <- function (sanat, jakopiste) {

    fr1 <- frekvenssit(sanat[1:jakopiste])

    N1 <- jakopiste

    fr2 <- frekvenssit(sanat[(jakopiste+1):(length(sanat))])

    N2 <- length(sanat) - jakopiste

    ln_usk1 <- 0
    for (tt in sanat[1:jakopiste]) { # uskottavuus on tulo kunkin havaitun sanan empriinen todennäköisyydestä.
        # log-uskottavuus on summa frekvenssien logaritmeista.
        # Silmukka laskee 1. osan osoittajien logaritmien summan.

#        fr1[fr1[,1]==tt,2] # sanan tt frekvenssi jaon 1. osassa
       ln_usk1 <- ln_usk1 + log(as.numeric(fr1[fr1[,1]==tt,2]))
    }
    ln_usk1 <- ln_usk1 - N1 * log(N1) # nimittäjät vielä

        ln_usk2 <- 0
    for (tt in sanat[(jakopiste+1):(length(sanat))]) { # uskottavuus on tulo kunkin havaitun sanan empriinen todennäköisyydestä.
        # log-uskottavuus on summa frekvenssien logaritmeista.
        # Silmukka laskee 2. osan osoittajien logaritmien summan.

#        fr1[fr1[,1]==tt,2] # sanan tt frekvenssi jaon 1. osassa
       ln_usk2 <- ln_usk2 + log(as.numeric(fr2[fr2[,1]==tt,2]))
    }
    ln_usk2 <- ln_usk2 - N2 * log(N2) # nimittäjät vielä

    return (ln_usk1 + ln_usk2) # Palauttaa ln_-uskottavuuden
}
