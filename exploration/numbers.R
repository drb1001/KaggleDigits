library(RColorBrewer)

setwd("/Users/danielbrown/Documents/_Personal/Coding projects/R/kaggle/KaggleDigits")

trainset <- read.csv("Original data sets/train.csv", header=TRUE)
testset <- read.csv("Original data sets/test.csv", header=TRUE)

my_palette <- colorRampPalette(c("white", "black"))(n = 50)


showtrainnumber <- function(n=0, data=trainset) { 
  train  <- as.matrix(trainset[n,][-1], nrow = 28, ncol = 28)
  dim(train)  <-  c(28,28)
  image(train, main = trainset[n,1], ylim =c(1,0), col = my_palette)
}

showtestnumber <- function(n=0, data=testset) { 
  test  <- as.matrix(testset[n,], nrow = 28, ncol = 28)
  dim(test)  <-  c(28,28)
  image(test, main = "(in test set)" , ylim =c(1,0), col = my_palette)
}

for (mycount1 in 1:10 ) { showtrainnumber(mycount1); Sys.sleep(0.5) }
# showtrainnumber(12)
# showtestnumber(12)


# try to plot using lattice

# for a (random?) sample of numbers in same group (in train), show the image
# x10 for a matrix of images



