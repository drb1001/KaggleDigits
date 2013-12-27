getwd()

mydf  <-  read.csv("train.csv")

head(mydf)
summary(mydf)

shownumber  <- function(n=0, data=mydf) { 
  test  <- as.matrix(mydf[n,][-1], nrow = 28, ncol = 28)
  dim(test)  <-  c(28,28)
  image(test, main = mydf[n,1] , ylim =c(1,0) )
}

for (mycount1 in 100:130 ) { shownumber(mycount1); Sys.sleep(0.5) }

?image