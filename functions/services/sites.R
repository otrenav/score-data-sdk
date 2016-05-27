##
## Sites service
##
## Datata, 2016
##

sites <- function(target=NULL, id=NULL, query=NULL) {
    if (is.null(target) & (!is.null(id) | !is.null(query))) {
        print_error("Query sent without `objects` specification")
    } else if (is.null(target)) {
        sites.documentation()
        print_raw('\n')
    } else {
        do.call(paste("sites.", target, sep=""), list(id, query))
    }
}


sites.contents <- function(id=NULL, query=NULL) {
    path <- "/sites/contents"
    request <- build_request(path, id, query)
    response <- api_get(request)
    data <- response_to_data(response)
    return(data)
}


sites.rows <- function(id=NULL, query=NULL) {
    path <- "/sites/rows"
    request <- build_request(path, id, query)
    response <- api_get(request)
    data <- response_to_data(response)
    return(data)
}


sites.sites <- function(id=NULL, query=NULL) {
    path <- "/sites/sites"
    request <- build_request(path, id, query)
    response <- api_get(request)
    data <- response_to_data(response)
    return(data)
}


sites.menus <- function(id=NULL, query=NULL) {
    path <- "/sites/menus"
    request <- build_request(path, id, query)
    response <- api_get(request)
    data <- response_to_data(response)
    return(data)
}


sites.submenus <- function(id=NULL, query=NULL) {
    path <- "/sites/submenus"
    request <- build_request(path, id, query)
    response <- api_get(request)
    data <- response_to_data(response)
    return(data)
}


sites.coordinations <- function(id=NULL, query=NULL) {
    path <- "/sites/coordinations"
    request <- build_request(path, id, query)
    response <- api_get(request)
    data <- response_to_data(response)
    return(data)
}


sites.panels <- function(id=NULL, query=NULL) {
    path <- "/sites/panels"
    request <- build_request(path, id, query)
    response <- api_get(request)
    data <- response_to_data(response)
    return(data)
}


sites.documentation <- function () {
    print_raw("\n- Sites service")
    print_raw("\n  -------------")
    print_raw("\n\t sites.contents([id, query]):       dataframe")
    print_raw("\n\t sites.rows([id, query]):           dataframe")
    print_raw("\n\t sites.sites([id, query]):          dataframe")
    print_raw("\n\t sites.menus([id, query]):          dataframe")
    print_raw("\n\t sites.submenus([id, query]):       dataframe")
    print_raw("\n\t sites.coordinations([id, query]):  dataframe")
    print_raw("\n\t sites.panels(id, query):           dataframe")
    print_raw("\n")
}
