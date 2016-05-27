##
## Profiles service
##
## Datata, 2016
##

profile <- function(target=NULL, id=NULL, query=NULL) {
    if (is.null(target) & (!is.null(id) | !is.null(query))) {
        print_error("Query sent without `objects` specification")
    } else if (is.null(target)) {
        profile.documentation()
        print_raw('\n')
    } else {
        do.call(paste("profile.", target, sep=""), list(id, query))
    }
}


profile.users <- function(id=NULL, query=NULL) {
    path <- "/accounts/users"
    request <- build_request(path, id, query)
    response <- api_get(request)
    data <- response_to_data(response)
    return(data)
}


profile.clients <- function(id=NULL, query=NULL) {
    path <- "/accounts/clients"
    request <- build_request(path, id, query)
    response <- api_get(request)
    data <- response_to_data(response)
    return(data)
}


profile.documentation <- function () {
    print_raw("\n- Profile service")
    print_raw("\n  ---------------")
    print_raw("\n\t profile.users([id, query]):    dataframe")
    print_raw("\n\t profile.clients([id, query]):  dataframe")
    print_raw("\n")
}
