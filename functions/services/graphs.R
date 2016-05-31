##
## Graphs service
##
## Datata, 2016
##

graphs <- function(parameters) {
    if (is.null(parameters$target)) {
        graphs.documentation()
        print_raw('\n')
    } else {
        do.call(paste("graphs.", parameters$target, sep=""), list(parameters))
    }
}


graphs.results <- function(parameters) {
    parameters$path <- "/graphs/results"
    if (!is.null(parameters$show_graph) & parameters$show_graph == "y") {
        show_graph_in_browser(parameters)
    } else {
        data <- get_data(parameters)
        return(data)
    }
}


graphs.coordinations <- function(parameters) {
    parameters$path <- "/graphs/coordinations"
    data <- get_data(parameters)
    return(data)
}


graphs.front_end_filters <- function(parameters) {
    parameters$path <- "/graphs/front_end_filters"
    data <- get_data(parameters)
    return(data)
}


graphs.tables <- function(parameters) {
    parameters$path <- "/graphs/tables"
    data <- get_data(parameters)
    return(data)
}


graphs.lines <- function(parameters) {
    parameters$path <- "/graphs/lines"
    data <- get_data(parameters)
    return(data)
}


graphs.columns <- function(parameters) {
    parameters$path <- "/graphs/columns"
    data <- get_data(parameters)
    return(data)
}


graphs.pies <- function(parameters) {
    parameters$path <- "/graphs/pies"
    data <- get_data(parameters)
    return(data)
}


graphs.documentation <- function () {
    print_raw("\n- Graphs service")
    print_raw("\n  --------------")
    print_raw("\n\t graphs / coordinations      dataframe")
    print_raw("\n\t graphs / front_end_filters  dataframe")
    print_raw("\n\t graphs / tables             dataframe")
    print_raw("\n\t graphs / lines              dataframe")
    print_raw("\n\t graphs / columns            dataframe")
    print_raw("\n\t graphs / pies               dataframe")
    print_raw("\n\t graphs / results            dataframe")
    print_raw("\n\t graphs / results_graph      graph in browser")
    print_raw("\n")
}

graphs.targets <- function() {
    ## TODO: (otrenav) sacar esto
    ## automáticamente para no tener
    ## que estar actualizando
    targets <- list(
        "results",
        "coordinations",
        "front_end_filters",
        "tables",
        "lines",
        "columns",
        "pies"
    )
}
