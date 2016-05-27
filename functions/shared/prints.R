##
## Print functions
##
## Datata, 2016
##

print_success <- function(message, detail="") {
    if (status_level != "ERRORS") {
        next_message <- paste("[+] SUCCESS: ", message, sep="")
        print_status(next_message, detail)
    }
}

print_info <- function(message, detail="") {
    if (status_level != "ERRORS") {
        next_message <- paste("[ ] INFO: ", message, sep="")
        print_status(next_message, detail)
    }
}

print_error <- function(message, detail="") {
    next_message <- paste("[!] ERROR: ", message, sep="")
    print_status(next_message, detail)
    stop()
}

print_status <- function(message, detail="") {
    next_message <- paste("\n", message, sep="")
    if (status_level == "DEBUG") {
        next_message <- paste(message, " (", detail, ")\n", sep="")
    } else {
        next_message <- paste(message, "\n", sep="")
    }
    print_raw(next_message)
}

print_raw <- function(message) {
    cat(sprintf(message))
}
