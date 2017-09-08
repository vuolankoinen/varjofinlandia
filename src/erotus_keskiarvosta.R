# Palauttaa kunkin alkion eron ympäröivien alkioiden keskiarvoon.

erotus_keskiarvosta <- function (jono, kantama=2) {
    tulos <- c()
    for (tt in 1:length(jono)) {
        yht <- 0
        alkioita <- 0
        for (ii in (max(1,tt-kantama)):(min(tt+kantama,length(jono)))) {
            alkioita <- alkioita + 1
            yht <- yht + jono[ii]
        }
        tulos <-  c(tulos, jono[tt] - (yht / alkioita))
    }
    return (tulos)
}
