##
## Questionnaires service
##
## Datata, 2016
##

questionnaires <- function(parameters) {
    if (is.null(parameters$target)) {
        questionnaires.documentation()
        print_raw('\n')
    } else {
        do.call(
            paste("questionnaires.", parameters$target, sep=""),
            list(parameters)
        )
    }
}

questionnaires.query <- function(parameters) {
    parameters$path <- "/questionnaires/results"
    data <- get_data(parameters)
    return(data)
}

questionnaires.results <- function(parameters) {
    parameters$path <- "/questionnaires/results"
    data <- get_data(parameters)
    return(data)
}


questionnaires.coordinations <- function(parameters) {
    parameters$path <- "/questionnaires/coordinations"
    data <- get_data(parameters)
    return(data)
}


questionnaires.backend_filters <- function(parameters) {
    parameters$path <- "/questionnaires/backend_filters"
    data <- get_data(parameters)
    return(data)
}


questionnaires.projects <- function(parameters) {
    parameters$path <- "/questionnaires/projects"
    data <- get_data(parameters)
    return(data)
}


questionnaires.persons <- function(parameters) {
    parameters$path <- "/questionnaires/persons"
    data <- get_data(parameters)
    return(data)
}


questionnaires.subjects <- function(parameters) {
    parameters$path <- "/questionnaires/subjects"
    data <- get_data(parameters)
    return(data)
}


questionnaires.questionnaires <- function(parameters) {
    parameters$path <- "/questionnaires/questionnaires"
    data <- get_data(parameters)
    return(data)
}


questionnaires.questionsets <- function(parameters) {
    parameters$path <- "/questionnaires/questionsets"
    data <- get_data(parameters)
    return(data)
}


questionnaires.run_infos <- function(parameters) {
    parameters$path <- "/questionnaires/run_infos"
    data <- get_data(parameters)
    return(data)
}


questionnaires.run_info_history <- function(parameters) {
    parameters$path <- "/questionnaires/run_info_history"
    data <- get_data(parameters)
    return(data)
}


questionnaires.questions <- function(parameters) {
    parameters$path <- "/questionnaires/questions"
    data <- get_data(parameters)
    return(data)
}


questionnaires.choices <- function(parameters) {
    parameters$path <- "/questionnaires/choices"
    data <- get_data(parameters)
    return(data)
}


questionnaires.files <- function(parameters) {
    parameters$path <- "/questionnaires/files"
    data <- get_data(parameters)
    return(data)
}


questionnaires.answers <- function(parameters) {
    parameters$path <- "/questionnaires/answers"
    data <- get_data(parameters)
    return(data)
}


questionnaires.cross_indexes <- function(parameters) {
    parameters$path <- "/questionnaires/cross_indexes"
    data <- get_data(parameters)
    return(data)
}


questionnaires.match_indexes <- function(parameters) {
    parameters$path <- "/questionnaires/match_indexes"
    data <- get_data(parameters)
    return(data)
}


questionnaires.documentation <- function() {
    print_raw("\n- Questionnaires service")
    print_raw("\n  ----------------------")
    print_raw("\n\t questionnaires / coordinations     dataframe")
    print_raw("\n\t questionnaires / backend_filters   dataframe")
    print_raw("\n\t questionnaires / projects          dataframe")
    print_raw("\n\t questionnaires / persons           dataframe")
    print_raw("\n\t questionnaires / subjects          dataframe")
    print_raw("\n\t questionnaires / questionnaires    dataframe")
    print_raw("\n\t questionnaires / questionsets      dataframe")
    print_raw("\n\t questionnaires / run_infos         dataframe")
    print_raw("\n\t questionnaires / run_info_history  dataframe")
    print_raw("\n\t questionnaires / questions         dataframe")
    print_raw("\n\t questionnaires / choices           dataframe")
    print_raw("\n\t questionnaires / files             dataframe")
    print_raw("\n\t questionnaires / answers           dataframe")
    print_raw("\n\t questionnaires / cross_indexes     dataframe")
    print_raw("\n\t questionnaires / match_indexes     dataframe")
    print_raw("\n\t questionnaires / results           dataframe")
    print_raw("\n")
}

questionnaires.targets <- function() {
    ## TODO: (otrenav) sacar esto
    ## automáticamente para no tener
    ## que estar actualizando
    targets <- list(
        "results",
        "coordinations",
        "backend_filters",
        "projects",
        "persons",
        "subjects",
        "questionnaires",
        "questionsets",
        "run_infos",
        "run_info_history",
        "questions",
        "choices",
        "files",
        "answers",
        "cross_indexes",
        "match_indexes"
    )
}

