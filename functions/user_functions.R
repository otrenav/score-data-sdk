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
        stop("Missing implementation.")
        ## TODO: Option 1: pre-made query in platform (use ID)
        ## TODO: Option 2: provide a query string
    } else {
        print_error("Unknown option", query_or_target)
    }
    return(parameters)
}

get_service_term <- function() {
    service <- tolower(readline(prompt="Service: "))
    if (!(service %in% availability())) {
        print_error("Unknown service", service)
    }
    return(service)
}


get_target_term <- function(service) {
    target <- tolower(readline(prompt="Target: "))
    if (!(target %in% availability(service))) {
        print_error("Unknown target for chosen service", target)
    }
    return(target)
}


get_update_term <- function() {
    update <- tolower(readline(prompt="Update (y/n)? "))
    if (!(update == "y" | update == "n")) {
        print_error("Unknown update value", update)
    }
    return(update)
}


get_show_graph_term <- function() {
    show_graph <- tolower(readline(prompt="Show graph (y/n)? "))
    if (!(show_graph == "y" | show_graph == "n")) {
        print_error("Unknown show_graph value", show_graph)
    }
    return(show_graph)
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
