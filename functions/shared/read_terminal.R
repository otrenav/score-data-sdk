##
## Functions that read from terminal
##
## Datata, 2016
##

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


