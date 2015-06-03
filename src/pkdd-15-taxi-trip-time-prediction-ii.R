library(readr)
library(rjson)

test <- read_csv("../input/test.csv")
mean_train_time <- 660
positions <- function(row) as.data.frame(do.call(rbind, fromJSON(row$POLYLINE)))

submission <- test["TRIP_ID"]

for (i in 1:nrow(test)) {
  submission$TRAVEL_TIME[i] <- max(15*nrow(positions(test[i,])), mean_train_time)
}

write_csv(submission, "my_submission.csv")