# Laskee sanalistan frekvenssit

frekvenssit <- function (lista) {
    frekv <- table(lista)
    frekv <- cbind(names(frekv), frekv)
#    frekv[,1] <-     as.numeric(frekv[,1])
#    frekv[,2] <-     as.numeric(frekv[,2])
    return(frekv)
}
