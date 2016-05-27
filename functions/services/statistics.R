##
## Statistics service
##
## Datata, 2016
##

statistics <- function(target=NULL, id=NULL, query=NULL) {
    if (is.null(target) & (!is.null(id) | !is.null(query))) {
        print_error("Query sent without `objects` specification")
    } else if (is.null(target)) {
        statistics.documentation()
        print_raw('\n')
    } else {
        do.call(paste("statistics.", target, sep=""), list(id, query))
    }
}


statistics.results <- function(id, unused_argument=NULL) {
    if (is.null(id)) {
        print_error("Should specify an <ID>")
    }
    path <- "/statistics/results"
    request <- build_request(path, id, query)
    response <- api_get(request)
    data <- response_to_data(response)
    return(data)
}


statistics.results_update <- function(id, unused_argument=NULL) {
    if (is.null(id)) {
        print_error("Should specify an <ID>")
    }
    path <- "/statistics/results"
    request <- paste(path, "/", id, "/update", sep="")
    response <- api_get(request)
    data <- response_to_data(response)
    return(data)
}


statistics.coordinations <- function(id=NULL, query=NULL) {
    path <- "/statistics/coordination"
    request <- build_request(path, id, query)
    response <- api_get(request)
    data <- response_to_data(response)
    return(data)
}


statistics.documentation <- function () {
    print_raw("\n- Statistics service")
    print_raw("\n  ------------------")
    print_raw("\n\t statistics.coordinations([id, query]):  dataframe")
    print_raw("\n\t statistics.results(id):                 dataframe")
    print_raw("\n\t statistics.results_update(id):          dataframe (updated)")
    print_raw("\n")
}
