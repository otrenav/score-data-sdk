##
## Functions to be used by users
##
## Datata, 2016
##

get_data <- function(service=NULL, target=NULL, id=NULL, query=NULL) {
    if (!is.null(service)) {
        do.call(service, list(target, id, query))
    } else {
        print_available_services()
    }
}

