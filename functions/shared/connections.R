##
## Connection functions
##
## Datata, 2016
##

if (!require("RJSONIO")) {
    install.packages("RJSONIO")
    require(RJSONIO)
}
if (!require("RCurl")) {
    install.packages("RCurl")
    require(RCurl)
}

api_get <- function(request, query="") {
    URL <- paste(base_URL, request, format_string, query, sep = "")
    print_info("Getting data...", URL)
    response <- NULL
    tryCatch({
        json <- getURL(URL)
        response <- fromJSON(json, unexpected.escape="keep")
    }, error = function(err) {
        print_error("Could not retrieve data", err)
    })
    print_success("Data retrieved", URL)
    return(response)
}
