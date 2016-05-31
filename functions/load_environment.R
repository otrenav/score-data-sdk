##
## Environment setup
##
## Datata, 2016
##

setwd(PLATFORM_APIS_DIRECTORY)

## Configuration
source("./score-data-sdk/functions/configuration.R")

## API Services
source("./score-data-sdk/functions/services/graphs.R")
source("./score-data-sdk/functions/services/markdown.R")
source("./score-data-sdk/functions/services/notification.R")
source("./score-data-sdk/functions/services/profile.R")
source("./score-data-sdk/functions/services/questionnaires.R")
source("./score-data-sdk/functions/services/sites.R")
source("./score-data-sdk/functions/services/statistics.R")
source("./score-data-sdk/functions/services/_utilities.R")

## Shared
source("./score-data-sdk/functions/shared/prints.R")
source("./score-data-sdk/functions/shared/get_data.R")
source("./score-data-sdk/functions/shared/connections.R")
source("./score-data-sdk/functions/shared/browser.R")
source("./score-data-sdk/functions/user_functions.R")
