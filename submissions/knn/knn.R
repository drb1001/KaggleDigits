# makes the KNN submission

library(FNN)

train <- read.csv("Original data sets/train.csv", header=TRUE)
test <- read.csv("Original data sets/test.csv", header=TRUE)

labels <- train[,1]
train <- train[,-1]

results <- (0:9)[knn(train, test, labels, k = 5, algorithm="cover_tree")]

write(results, file="knn_benchmark_k5.csv", ncolumns=1) 
