##
## Graphs service
##
## Datata, 2016
##

graphs <- function(target=NULL, id=NULL, query=NULL) {
    if (is.null(target) & (!is.null(id) | !is.null(query))) {
        print_error("Query sent without `objects` specification")
    } else if (is.null(target)) {
        graphs.documentation()
        print_raw('\n')
    } else {
        do.call(paste("graphs.", target, sep=""), list(id, query))
    }
}


graphs.results_graph <- function(id, unused_argument=NULL) {
    if (is.null(id)) {
        print_error("Should specify an <ID>")
    }
    path <- "/graphs/results"
    request <- paste(base_URL, path, "/", id, "/graph", sep="")
    browseURL(request)
}


graphs.results <- function(id, unused_argument=NULL) {
    if (is.null(id)) {
        print_error("Should specify an <ID>")
    }
    path <- "/graphs/results"
    request <- build_request(path, id, query)
    response <- api_get(request)
    data <- response_to_data(response)
    return(data)
}


graphs.results_update <- function(id, unused_argument=NULL) {
    if (is.null(id)) {
        print_error("Should specify an <ID>")
    }
    path <- "/graphs/results"
    request <- paste(path, "/", id, "/update", sep="")
    response <- api_get(request)
    data <- response_to_data(response)
    return(data)
}


graphs.coordinations <- function(id=NULL, query=NULL) {
    path <- "/graphs/coordinations"
    request <- build_request(path, id, query)
    response <- api_get(request)
    data <- response_to_data(response)
    return(data)
}


graphs.front_end_filters <- function(id=NULL, query=NULL) {
    path <- "/graphs/front_end_filters"
    request <- build_request(path, id, query)
    response <- api_get(request)
    data <- response_to_data(response)
    return(data)
}


graphs.tables <- function(id=NULL, query=NULL) {
    path <- "/graphs/tables"
    request <- build_request(path, id, query)
    response <- api_get(request)
    data <- response_to_data(response)
    return(data)
}


graphs.lines <- function(id=NULL, query=NULL) {
    path <- "/graphs/lines"
    request <- build_request(path, id, query)
    response <- api_get(request)
    data <- response_to_data(response)
    return(data)
}


graphs.columns <- function(id=NULL, query=NULL) {
    path <- "/graphs/columns"
    request <- build_request(path, id, query)
    response <- api_get(request)
    data <- response_to_data(response)
    return(data)
}


graphs.pies <- function(id=NULL, query=NULL) {
    path <- "/graphs/pies"
    request <- build_request(path, id, query)
    response <- api_get(request)
    data <- response_to_data(response)
    return(data)
}


graphs.documentation <- function () {
    print_raw("\n- Graphs service")
    print_raw("\n  --------------")
    print_raw("\n\t graphs.coordinations([id, query]):      dataframe")
    print_raw("\n\t graphs.front_end_filters([id, query]):  dataframe")
    print_raw("\n\t graphs.tables([id, query]):             dataframe")
    print_raw("\n\t graphs.lines([id, query]):              dataframe")
    print_raw("\n\t graphs.columns([id, query]):            dataframe")
    print_raw("\n\t graphs.pies([id, query]):               dataframe")
    print_raw("\n\t graphs.results(id, query):              dataframe")
    print_raw("\n\t graphs.results_update(id):              dataframe (updated)")
    print_raw("\n\t graphs.results_graph(id):               graph in browser")
    print_raw("\n")
}
