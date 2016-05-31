##
## Browser functions
##
## Datata, 2016
##

show_graph_in_browser <- function(parameters) {
    URL <- build_URL_for_graph(parameters)
    print(URL)
    browseURL(URL)
}
