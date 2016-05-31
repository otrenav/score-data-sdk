##
## Print functions
##
## Datata, 2016
##

print_success <- function(message, detail="", override=NULL) {
    if (status_level != "ERRORS") {
        next_message <- paste("[+] SUCCESS: ", message, sep="")
        print_status(next_message, detail, override)
    }
}


print_info <- function(message, detail="", override=NULL) {
    if (status_level != "ERRORS") {
        next_message <- paste("[ ] INFO: ", message, sep="")
        print_status(next_message, detail, override)
    }
}


print_error <- function(message, detail="", override=NULL) {
    next_message <- paste("[!] ERROR: ", message, sep="")
    print_status(next_message, detail, override)
    stop()
}


print_warning <- function(message, detail="", override=NULL) {
    if (status_level != "ERRORS") {
        next_message <- paste("[!] WARNING: ", message, sep="")
        print_status(next_message, detail, override)
    }
}


print_status <- function(message, detail="", override=NULL) {
    next_message <- paste("\n", message, sep="")
    if (status_level == "DEBUG" || (!is.null(override) & override)) {
        next_message <- paste(message, " (", detail, ")\n", sep="")
    } else {
        next_message <- paste(message, "\n", sep="")
    }
    print_raw(next_message)
}


print_raw <- function(message) {
    cat(sprintf(message))
}
