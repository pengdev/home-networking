library(devtools)
library(rga)
rga.open(instance="ga")
id <- "79254207"
myresults <- ga$getData(id, start.date="2013-11-27",end.date="2015-03-27", metrics="ga:visits")
myresults
barplot(myresults$visits, main="Visit by day",xlab="Day",names.arg=myresults$date, las=1)

slices <- receiverByUser$users
lbls <-receiverByUser$eventLabel
pct <-  round(slices/sum(slices)*100)
lbls <- paste(lbls, pct)
lbls <- paste(lbls,"%",sep="")
pie(slices, labels= lbls, main="Receiver by popularity")

countryByUser <- ga$getData(id, start.date="2013-11-27",end.date="2015-03-27", metrics="ga:users", dimensions ="ga:country", sort="-ga:users")