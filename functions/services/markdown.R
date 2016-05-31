##
## Markdown service
##
## Datata, 2016
##

markdown <- function(parameters) {
    if (is.null(parameters$target)) {
        markdown.documentation()
        print_raw('\n')
    } else {
        do.call(paste("markdown.", parameters$target, sep=""), list(parameters))
    }
}


markdown.text <- function(parameters) {
    parameters$path <- "/markdown/markdown_text"
    data <- get_data(parameters)
    return(data)
}


markdown.documentation <- function () {
    print_raw("\n- Markdown service")
    print_raw("\n  ----------------")
    print_raw("\n\t markdown / text  dataframe")
    print_raw("\n")
}

markdown.targets <- function() {
    ## TODO: (otrenav) sacar esto
    ## automáticamente para no tener
    ## que estar actualizando
    targets <- list(
        "text"
    )
}
