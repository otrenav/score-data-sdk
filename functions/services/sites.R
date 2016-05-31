##
## Sites service
##
## Datata, 2016
##

sites <- function(parameters) {
    if (is.null(parameters$target)) {
        sites.documentation()
        print_raw('\n')
    } else {
        do.call(paste("sites.", parameters$target, sep=""), list(parameters))
    }
}


sites.contents <- function(parameters) {
    parameters$path <- "/sites/contents"
    data <- get_data(parameters)
    return(data)
}


sites.rows <- function(parameters) {
    parameters$path <- "/sites/rows"
    data <- get_data(parameters)
    return(data)
}


sites.sites <- function(parameters) {
    parameters$path <- "/sites/sites"
    data <- get_data(parameters)
    return(data)
}


sites.menus <- function(parameters) {
    parameters$path <- "/sites/menus"
    data <- get_data(parameters)
    return(data)
}


sites.submenus <- function(parameters) {
    parameters$path <- "/sites/submenus"
    data <- get_data(parameters)
    return(data)
}


sites.coordinations <- function(parameters) {
    parameters$path <- "/sites/coordinations"
    data <- get_data(parameters)
    return(data)
}


sites.panels <- function(parameters) {
    parameters$path <- "/sites/panels"
    data <- get_data(parameters)
    return(data)
}


sites.documentation <- function () {
    print_raw("\n- Sites service")
    print_raw("\n  -------------")
    print_raw("\n\t sites / contents       dataframe")
    print_raw("\n\t sites / rows           dataframe")
    print_raw("\n\t sites / sites          dataframe")
    print_raw("\n\t sites / menus          dataframe")
    print_raw("\n\t sites / submenus       dataframe")
    print_raw("\n\t sites / coordinations  dataframe")
    print_raw("\n\t sites / panels         dataframe")
    print_raw("\n")
}

markdown.targets <- function() {
    ## TODO: (otrenav) sacar esto
    ## automáticamente para no tener
    ## que estar actualizando
    targets <- list(
        "contents",
        "rows",
        "sites",
        "menus",
        "submenus",
        "coordinations",
        "panels"
    )
}
