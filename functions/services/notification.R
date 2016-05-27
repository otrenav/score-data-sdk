##
## Notification service
##
## Datata, 2016
##

notification <- function(target=NULL, id=NULL, query=NULL) {
    if (is.null(target) & (!is.null(id) | !is.null(query))) {
        print_error("Query sent without `objects` specification")
    } else if (is.null(target)) {
        notification.documentation()
        print_raw('\n')
    } else {
        do.call(paste("notification.", target, sep=""), list(id, query))
    }
}


notification.users <- function(id=NULL, query=NULL) {
    path <- "/notification/users"
    request <- build_request(path, id, query)
    response <- api_get(request)
    data <- response_to_data(response)
    return(data)
}


notification.groups <- function(id=NULL, query=NULL) {
    path <- "/notification/groups"
    request <- build_request(path, id, query)
    response <- api_get(request)
    data <- response_to_data(response)
    return(data)
}


notification.documentation <- function () {
    print_raw("\n- Notification service")
    print_raw("\n  --------------------")
    print_raw("\n\t notification.users([id, query]):   dataframe")
    print_raw("\n\t notification.groups([id, query]):  dataframe")
    print_raw("\n")
}
