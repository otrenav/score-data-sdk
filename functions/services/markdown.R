##
## Markdown service
##
## Datata, 2016
##

markdown <- function(target=NULL, id=NULL, query=NULL) {
    if (is.null(target) & (!is.null(id) | !is.null(query))) {
        print_error("Query sent without `objects` specification")
    } else if (is.null(target)) {
        markdown.documentation()
        print_raw('\n')
    } else {
        do.call(paste("markdown.", target, sep=""), list(id, query))
    }
}


markdown.text <- function(id=NULL, query=NULL) {
    path <- "/markdown/markdown_text"
    request <- build_request(path, id, query)
    response <- api_get(request)
    data <- response_to_data(response)
    return(data)
}


markdown.documentation <- function () {
    print_raw("\n- Markdown service")
    print_raw("\n  ----------------")
    print_raw("\n\t markdown.text([id, query]):  dataframe")
    print_raw("\n")
}
