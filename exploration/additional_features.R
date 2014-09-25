
setwd("/Users/danielbrown/Documents/_Personal/Coding projects/R/kaggle/KaggleDigits")

trainset <- read.csv("Original data sets/train.csv", header=TRUE)
testset <- read.csv("Original data sets/test.csv", header=TRUE)

trainset_new <- trainset
# total ink (sum of all)
trainset_new$total_ink <- apply(trainset_new,1,sum)

# total height (any column with ink)
trainset_new$total_height <- apply(trainset_new,1,??)

# total areas (sum of squares)


# total length (any row with ink)
# centre of gravity (average position of height vs length)
# ??


head(trainset_new[,c(1,786)],10)


