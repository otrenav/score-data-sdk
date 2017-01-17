##
## Utility functions for services
##
## Datata, 2016
##


response_to_dataframe <- function(response, parameters) {
    n_rows <- NULL
    response_to_unpack <- NULL
    if (!is.null(response$results)) {
        ## Various results: DRF Framework
        column_names <- names(response$results[[1]])
        to_unpack <- lapply(response$results, null_to_na)
        n_cols <- length(response$results)
        ##
        ## TODO: Warning message:
        ## In matrix(unlist(to_unpack), ncol = n_cols) :
        ## data length [60003] is not a sub-multiple or
        ## multiple of the number of rows [7]
        ##
        ## To replicate ask for all the `answers` from
        ## `questionnaires` and look for loop #83.
        ##
        data <- data.frame(
            ## Transpose is needed to unpack correctly
            t(matrix(unlist(to_unpack), ncol=n_cols)),
            stringsAsFactors=FALSE
        )
    } else if (!is.null(parameters$query)) {
        ##
        ## TODO: (otrenav) remove this part of the SDK
        ## NOTE: It's not currently being used.
        ##
        ## Various results: Datata API format
        column_names <- names(response[[1]])
        to_unpack <- lapply(response, null_to_na)
        n_cols <- length(response)
        data <- data.frame(
            ## Transpose is needed to unpack correctly
            t(matrix(unlist(to_unpack), ncol=n_cols)),
            stringsAsFactors=FALSE
        )
    } else {
        ## Single result (e.g. ID was specified)
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


availability <- function(service=NULL) {
    ##
    ## Return the list of available services
    ## or targets available within a service
    ##
    if (is.null(service)) {
        return(available_services())
    } else {
        return(available_targets(service))
    }
}


available_services <- function() {
    available_services <- list()
    services <- list.files("./score-data-sdk/functions/services/")
    for (service in services) {
        ## By convention if it starts with '_',
        ## then it is not a service (e.g. this file)
        if (substr(service, 1, 1) != "_") {
            service <- gsub(".R", "", service)
            available_services <- cbind(available_services, service)
        }
    }
    return(available_services)
}

available_targets <- function(service) {
    available_targets <- do.call(paste(service, ".targets", sep=""), list())
    return(available_targets)
}


print_available_services <- function() {
    services <- available_services()
    for (service in services) {
        do.call(paste(service, ".documentation", sep=""), list())
    }
    print_raw("\n")
}
