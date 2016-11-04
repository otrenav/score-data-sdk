##
## Get data from APIs
##
## Datata, 2016
##

get_data <- function(parameters) {
    ##
    ## Django REST Framework uses the `count`
    ## key to specify the total number of results
    ##
    URL <- build_URL(parameters)
    metadata_response <- api_get(URL)
    number_of_results <- metadata_response$count  ## DRF specific
    if (!is.null(number_of_results)) {
        data <- get_data_multiple_results(parameters, number_of_results)
    } else {
        data <- get_data_single_result(parameters)
    }
    data <- data[!duplicated(data), ]
    return(data)
}


get_data_multiple_results <- function(parameters, number_of_results) {
    ##
    ## Paginate through results and join them
    ## `max_results` is retrieved from the configuration
    ##
    data <- NULL
    number_of_loops <- ceiling(number_of_results/max_results)
    for (loop in 1:number_of_loops) {
        print_info(
            paste("LOOP: ", loop, "/", number_of_loops, sep=""),
            paste(round(loop / number_of_loops * 100, 2), " percent", sep=""),
            override=TRUE
        )
        URL <- build_URL(parameters, loop)
        data_dataframe <- get_data_as_dataframe(URL, parameters)
        data <- rbind(data, data_dataframe)
    }
    return(data)
}

get_data_single_result <- function(parameters) {
    URL <- build_URL(parameters)
    data <- get_data_as_dataframe(URL, parameters)
    return(data)
}

get_data_as_dataframe <- function(URL, parameters) {
    response <- api_get(URL)
    data <- response_to_dataframe(response, parameters)
    return(data)
}
