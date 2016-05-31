##
## Profiles service
##
## Datata, 2016
##

profile <- function(parameters) {
    if (is.null(parameters$target)) {
        profile.documentation()
        print_raw('\n')
    } else {
        do.call(paste("profile.", parameters$target, sep=""), list(parameters))
    }
}


profile.users <- function(parameters) {
    parameters$path <- "/accounts/users"
    data <- get_data(parameters)
    return(data)
}


profile.clients <- function(parameters) {
    parameters$path <- "/accounts/clients"
    data <- get_data(parameters)
    return(data)
}


profile.documentation <- function () {
    print_raw("\n- Profile service")
    print_raw("\n  ---------------")
    print_raw("\n\t profile / users    dataframe")
    print_raw("\n\t profile / clients  dataframe")
    print_raw("\n")
}

profile.targets <- function() {
    ## TODO: (otrenav) sacar esto
    ## automáticamente para no tener
    ## que estar actualizando
    targets <- list(
        "users",
        "clients"
    )
}
