##
## Authentication procedures
##
## Use your existing username and password that you
## use to login to the platform. This will generate
## a JWT specification token that will be sent in all
## your requests.
##
## Datata, 2016
##

require(httr)

AUTH_FILE <- "./score-data-sdk/functions/authentication/token.csv"

authenticate <- function() {
    if (file.exists(AUTH_FILE)) {
        token_data <- read.csv(AUTH_FILE)
        token <- token_data$token[1]
    } else {
        print("[!] No existing token found")
        username <- readline(prompt = "User: ")
        password <- readline(prompt = "Password: ")
        token <- get_token(username, password)
    }
    return(token)
}

read_token <- function() {
    token <- read.csv(AUTH_FILE)
    return(as.character(token$token[1]))
 }

get_token <- function(username, password) {
    URL <- paste(base_URL, "/API-Token-Auth/", sep = "")
    body <- list("username" = username, "password" = password)

    tryCatch({
        response <- POST(URL, body = body, encode = "json")
        stop_for_status(response)
    }, error = function(error) {
        print("")
        print("[X] Authentication failed")
        print("")
        stop("Authentication failed")
    })

    token <- content(response, type = "application/json")$token
    token_data <- data.frame(token=c(NA))
    token_data$token[1] <- token
    write.csv(token_data, file = AUTH_FILE, row.names = FALSE)
    print("[ ] Authentication token saved")
    return(token)
}
