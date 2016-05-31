##
## Notification service
##
## Datata, 2016
##

notification <- function(parameters) {
    if (is.null(parameters$target)) {
        notification.documentation()
        print_raw('\n')
    } else {
        do.call(paste("notification.", parameters$target, sep=""), list(parameters))
    }
}


notification.users <- function(parameters) {
    parameters$path <- "/notification/users"
    data <- get_data(parameters)
    return(data)
}


notification.groups <- function(parameters) {
    parameters$path <- "/notification/groups"
    data <- get_data(parameters)
    return(data)
}


notification.documentation <- function () {
    print_raw("\n- Notification service")
    print_raw("\n  --------------------")
    print_raw("\n\t notification / users   dataframe")
    print_raw("\n\t notification / groups  dataframe")
    print_raw("\n")
}

notification.targets <- function() {
    ## TODO: (otrenav) sacar esto
    ## automáticamente para no tener
    ## que estar actualizando
    targets <- list(
        "users",
        "groups"
    )
}
