##
## Functions to be used by users
##
## Datata, 2016
##

API_data <- function(parameters=NULL) {
    data <- NULL
    if (is.null(parameters)) {
        print_available_services()
        parameters <- use_wizard()
    }
    if (!is.null(parameters) & !is.null(parameters$service)) {
        data <- do.call(parameters$service, list(parameters))
    }
    if(!is.null(data)) {
        return(data)
    }
}

build_parameters <- function() {
    ##
    ## TODO: (otrenav)
    ## 1. Agregar opción $update <- TRUE
    ## 2. Agregar combinaciones de casos
    ## 3. Mostrar gráfica en Graphs
    ##
    parameters <- list()
    parameters$service <- get_service_term()
    query_or_target <- tolower(readline(prompt="Target (T) or Query (Q)? "))
    if (query_or_target == "t") {
        parameters$target <- get_target_term(parameters$service)
        if (parameters$target == "results") {
            parameters$id <- readline(prompt="ID: ")
            parameters$update <- get_update_term()
            if (parameters$service == "graphs") {
                parameters$show_graph <- get_show_graph_term()
            }
        } else {
            all_or_id <- tolower(readline(prompt="All (A) or ID (I)? "))
            if (all_or_id == "i") {
                parameters$id <- readline(prompt="ID: ")
            } else if (all_or_id == "a") {
                parameters$all <- TRUE
            } else {
                print_error("Unknown option", all_or_id)
            }
        }
    } else if (query_or_target == "q") {
        ##
        ## TODO: Option: pre-made query in platform (use ID)
        ##
        ## Note: Remember to remove the "?"
        ## from the "?&" at the beginning when
        ## using query parameters
        parameters$target <- "query"
        parameters$query <- readline(prompt="Query: ")
    } else {
        print_error("Unknown option", query_or_target)
    }
    return(parameters)
}

use_wizard <- function() {
    parameters <- NULL
    wizard <- tolower(readline(prompt="Use wizard (y/n)? "))
    if (wizard == "y") {
        parameters <- build_parameters()
    } else if (wizard != "n") {
        print_error("Unknown wizard value", wizard)
    }
    return(parameters)
}

##
## NOTE: be careful when using this functions, as you may
## have more than one answer per row in the `answer` column
## for the dataframe. It may be the case when there are
## multiple answers for a given observation.
##

remove_brackets_and_quotes <- function(data, column='answer') {
    column_aux <- gsub('\\["', '', data[, column])
    column_aux <- gsub('"\\]', '', column_aux)
    data[, column] <- column_aux
    return(data)
}

convert_to_numbers <- function(data, column='answer') {
    column_aux <- as.numeric(data[, column])
    data[, column] <- column_aux
    return(data)
}

clean_numbers <- function(data, column='answer') {
    return(convert_to_numbers(remove_brackets_and_quotes(data, column), column))
}
