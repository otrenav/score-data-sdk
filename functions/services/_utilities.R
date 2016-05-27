##
## Utility functions for services
##
## Datata, 2016
##

print_available_services <- function() {
    services <- list.files("./score-data-sdk/functions/services/")
    print_raw("\nAvailable platform services\n")
    for (service in services) {
        ## By convention if it starts with '_',
        ## then it is not a service
        if (substr(service, 1, 1) != "_") {
            service <- gsub(".R", "", service)
            do.call(paste(service, ".documentation", sep=""), list())
        }
    }
    print_raw("\n\n")
}


build_request <- function(path, id=NULL, query=NULL) {
    request <- NULL
    if (!is.null(id)) {
        request <- paste(path, "/", id, sep="")
    } else {
        request <- path
    }
    return(request)
}

response_to_data <- function(response) {
    n_rows <- NULL
    response_to_unpack <- NULL
    if (!is.null(response$results)) {
        ## Various results
        column_names <- names(response$results[[1]])
        to_unpack <- lapply(response$results, null_to_na)
        n_rows <- length(response$results)
        data <- data.frame(
            t(matrix(unlist(to_unpack), nrow=n_rows)),
            stringsAsFactors=FALSE
        )
    } else {
        ## Single result
        column_names <- names(response)
        to_unpack <- null_to_na(response)
        n_rows <- 1
        data <- data.frame(
            matrix(unlist(to_unpack), nrow=n_rows),
            stringsAsFactors=FALSE
        )
    }
    colnames(data) <- column_names
    return(data)
}

null_to_na <- function(x) {
    x[sapply(x, is.null)] <- NA
    return(x)
}
