# create a baseline file, all answers 0

#  test <- read.csv("Original data sets/test.csv", header=TRUE)
len <- nrow(test)

mydf <- data.frame(matrix(0, ncol = 2, nrow = len))
names(mydf) <- c("ImageId", "Label")
mydf$ImageId <- 1:nrow(mydf)

write.csv(mydf, file="baseline_submission.csv", quote = FALSE, row.names = FALSE) 

