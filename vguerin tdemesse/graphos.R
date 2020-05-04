
library(ggplot2)

data<-read.table("dataos.csv",sep="," ,header = TRUE)
dataf<-data.frame(data)


par(mfrow=c(2,2))
barplot(dataf$Linux~dataf$Date)          
barplot(dataf$Windows~dataf$Date)          
barplot(dataf$OS.X~dataf$Date)          
barplot(dataf$Chrome.OS~dataf$Date)          

