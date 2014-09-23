# makes the KNN submission

library(FNN)

train <- read.csv("Original data sets/train.csv", header=TRUE)
test <- read.csv("Original data sets/test.csv", header=TRUE)

## for small sample testing of output
# train <- train[1:1000,]
# test <- test[1:1000,]

labels <- train[,1]
train <- train[,-1]

results <- data.frame((0:9)[knn(train, test, labels, k = 3, algorithm="cover_tree")])

names(results) <- c("Label")
results$ImageId <- 1:nrow(results)
results <- results[c(2,1)]

write.csv(results, file="knn_k3.csv", quote = FALSE, row.names = FALSE) 

