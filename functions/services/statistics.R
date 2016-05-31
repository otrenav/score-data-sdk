##
## Statistics service
##
## Datata, 2016
##

statistics <- function(parameters) {
    if (is.null(parameters$target)) {
        statistics.documentation()
        print_raw('\n')
    } else {
        do.call(paste("statistics.", parameters$target, sep=""), list(parameters))
    }
}


statistics.results <- function(parameters) {
    parameters$path <- "/statistics/results"
    data <- get_data(parameters)
    return(data)
}


statistics.coordinations <- function(parameters) {
    parameters$path <- "/statistics/coordination"
    data <- get_data(parameters)
    return(data)
}


statistics.documentation <- function () {
    print_raw("\n- Statistics service")
    print_raw("\n  ------------------")
    print_raw("\n\t statistics / coordinations   dataframe")
    print_raw("\n\t statistics / results         dataframe")
    print_raw("\n")
}

markdown.targets <- function() {
    ## TODO: (otrenav) sacar esto
    ## automáticamente para no tener
    ## que estar actualizando
    targets <- list(
        "results",
        "coordinations"
    )
}
