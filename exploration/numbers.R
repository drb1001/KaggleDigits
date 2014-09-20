getwd()
library("RColorBrewer")

mydf  <-  read.csv("train.csv")

# head(mydf)
# summary(mydf)

my_palette <- colorRampPalette(c("white", "black"))(n = 50)

shownumber  <- function(n=0, data=mydf) { 
  test  <- as.matrix(mydf[n,][-1], nrow = 28, ncol = 28)
  dim(test)  <-  c(28,28)
  image(test, main = mydf[n,1] , ylim =c(1,0), col = my_palette)
}

for (mycount1 in 1000:1050 ) { shownumber(mycount1); Sys.sleep(0.1) }
