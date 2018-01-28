# Palauttaa kunkin alkion eron ympäröivien alkioiden keskiarvoon.

erotus_keskiarvosta <- function (jono, kantama=2) {
    vapply(1:length(jono), function (tt) jono[tt] - mean(jono[(max(1,tt-kantama)):(min(tt+kantama,length(jono)))]), numeric(1))
}
