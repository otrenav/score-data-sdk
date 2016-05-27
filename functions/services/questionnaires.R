##
## Questionnaires service
##
## Datata, 2016
##

questionnaires <- function(target=NULL, id=NULL, query=NULL) {
    if (is.null(target) & (!is.null(id) | !is.null(query))) {
        print_error("Query sent without `objects` specification")
    } else if (is.null(target)) {
        questionnaires.documentation()
        print_raw('\n')
    } else {
        do.call(paste("questionnaires.", target, sep=""), list(id, query))
    }
}


questionnaires.results_update <- function(id, unused_argument=NULL) {
    if (is.null(id)) {
        print_error("Should specify an <ID>")
    }
    path <- "/questionnaires/results"
    request <- paste(path, "/", id, "/update", sep="")
    response <- api_get(request)
    data <- response_to_data(response)
    return(data)
}


questionnaires.results <- function(id, unused_argument=NULL) {
    if (is.null(id)) {
        print_error("Should specify an <ID>")
    }
    path <- "/questionnaires/results"
    request <- build_request(path, id, query)
    response <- api_get(request)
    data <- response_to_data(response)
    return(data)
}


questionnaires.coordinations <- function(id=NULL, query=NULL) {
    path <- "/questionnaires/coordinations"
    response <- api_get(request)
    data <- response_to_data(response)
    return(data)
}


questionnaires.backend_filters <- function(id=NULL, query=NULL) {
    path <- "/questionnaires/backend_filters"
    request <- build_request(path, id, query)
    response <- api_get(request)
    data <- response_to_data(response)
    return(data)
}


questionnaires.projects <- function(id=NULL, query=NULL) {
    path <- "/questionnaires/projects"
    request <- build_request(path, id, query)
    response <- api_get(request)
    data <- response_to_data(response)
    return(data)
}


questionnaires.persons <- function(id=NULL, query=NULL) {
    path <- "/questionnaires/persons"
    request <- build_request(path, id, query)
    response <- api_get(request)
    data <- response_to_data(response)
    return(data)
}


questionnaires.subjects <- function(id=NULL, query=NULL) {
    path <- "/questionnaires/subjects"
    request <- build_request(path, id, query)
    response <- api_get(request)
    data <- response_to_data(response)
    return(data)
}


questionnaires.questionnaires <- function(id=NULL, query=NULL) {
    path <- "/questionnaires/questionnaires"
    request <- build_request(path, id, query)
    response <- api_get(request)
    data <- response_to_data(response)
    return(data)
}


questionnaires.questionsets <- function(id=NULL, query=NULL) {
    path <- "/questionnaires/questionsets"
    request <- build_request(path, id, query)
    response <- api_get(request)
    data <- response_to_data(response)
    return(data)
}


questionnaires.run_infos <- function(id=NULL, query=NULL) {
    path <- "/questionnaires/run_infos"
    request <- build_request(path, id, query)
    response <- api_get(request)
    data <- response_to_data(response)
    return(data)
}


questionnaires.run_info_history <- function(id=NULL, query=NULL) {
    path <- "/questionnaires/run_info_history"
    request <- build_request(path, id, query)
    response <- api_get(request)
    data <- response_to_data(response)
    return(data)
}


questionnaires.questions <- function(id=NULL, query=NULL) {
    path <- "/questionnaires/questions"
    request <- build_request(path, id, query)
    response <- api_get(request)
    data <- response_to_data(response)
    return(data)
}


questionnaires.choices <- function(id=NULL, query=NULL) {
    path <- "/questionnaires/choices"
    request <- build_request(path, id, query)
    response <- api_get(request)
    data <- response_to_data(response)
    return(data)
}


questionnaires.files <- function(id=NULL, query=NULL) {
    path <- "/questionnaires/files"
    request <- build_request(path, id, query)
    response <- api_get(request)
    data <- response_to_data(response)
    return(data)
}


questionnaires.answers <- function(id=NULL, query=NULL) {
    path <- "/questionnaires/answers"
    request <- build_request(path, id, query)
    response <- api_get(request)
    data <- response_to_data(response)
    return(data)
}


questionnaires.cross_indexes <- function(id=NULL, query=NULL) {
    path <- "/questionnaires/cross_indexes"
    request <- build_request(path, id, query)
    response <- api_get(request)
    data <- response_to_data(response)
    return(data)
}


questionnaires.match_indexes <- function(id=NULL, query=NULL) {
    path <- "/questionnaires/match_indexes"
    request <- build_request(path, id, query)
    response <- api_get(request)
    data <- response_to_data(response)
    return(data)
}


questionnaires.documentation <- function() {
    print_raw("\n- Questionnaires service")
    print_raw("\n  ----------------------")
    print_raw("\n\t questionnaires.coordinations([id, query]):     dataframe")
    print_raw("\n\t questionnaires.backend_filters([id, query]):   dataframe")
    print_raw("\n\t questionnaires.projects([id, query]):          dataframe")
    print_raw("\n\t questionnaires.persons([id, query]):           dataframe")
    print_raw("\n\t questionnaires.subjects([id, query]):          dataframe")
    print_raw("\n\t questionnaires.questionnaires([id, query]):    dataframe")
    print_raw("\n\t questionnaires.questionsets([id, query]):      dataframe")
    print_raw("\n\t questionnaires.run_infos([id, query]):         dataframe")
    print_raw("\n\t questionnaires.run_info_history([id, query]):  dataframe")
    print_raw("\n\t questionnaires.questions([id, query]):         dataframe")
    print_raw("\n\t questionnaires.choices([id, query]):           dataframe")
    print_raw("\n\t questionnaires.files([id, query]):             dataframe")
    print_raw("\n\t questionnaires.answers([id, query]):           dataframe")
    print_raw("\n\t questionnaires.cross_indexes([id, query]):     dataframe")
    print_raw("\n\t questionnaires.match_indexes([id, query]):     dataframe")
    print_raw("\n\t questionnaires.results(id):                    dataframe")
    print_raw("\n\t questionnaires.results_update(id):             dataframe (updated)")
    print_raw("\n")
}

