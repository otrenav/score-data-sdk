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

api_get <- function(URL) {
    print_info("Getting data...", URL)
    response <- NULL
    tryCatch({
        json <- getURL(URL, ssl.verifypeer = FALSE)
        response <- fromJSON(json, unexpected.escape="keep")
    }, error = function(err) {
        print_error("Could not retrieve data", err)
    })
    print_success("Data retrieved", URL)
    return(response)
}


build_URL <- function(parameters, loop=NULL) {
    ##
    ## NOTES:
    ## 1. `max_results` is retrieved from the configuration
    ## 2. `page` and `limit` depend on DRF configuration
    ##
    update <- update_string(parameters)
    URL_pre <- paste(base_URL, parameters$path, sep="")
    if (!is.null(loop) | !is.null(parameters$query)) {
        URL_mid <- paste("/?", parameters$query, sep="")
        if (!is.null(loop)) {
            URL_mid <- paste(URL_mid, "&limit=", max_results, "&page=", loop, sep="")
        }
        URL_mid <- paste(URL_mid, "&", sep="")
    } else if (!is.null(parameters$id)) {
        URL_mid <- paste("/", parameters$id, update, "/?", sep="")
    } else {
        URL_mid <- paste("/?", sep="")
    }
    URL <- paste(URL_pre, URL_mid, format_string, sep="")
    return(URL)
}

build_URL_for_graph <- function(parameters) {
    if (!is.null(parameters$update) && parameters$update == "y") {
        print_warning("Overriding `update` with `show_graph`")
    }
    URL_pre <- paste(base_URL, parameters$path, sep="")
    URL_mid <- paste("/", parameters$id, "/graph/", sep="")
    URL <- paste(URL_pre, URL_mid, sep="")
    return(URL)
}


update_string <- function(parameters) {
    update <- NULL
    if (!is.null(parameters$update) && parameters$update == "y") {
        update <- "/update"
    } else {
        update <- ""
    }
    return(update)
}
