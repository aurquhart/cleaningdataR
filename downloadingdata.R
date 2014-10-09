getwd()
if(!file.exists("testy1")) {dir.create("testy1")}

fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType = Download"

setInternet2(use = TRUE)
download.file(fileUrl, destfile = "./testy1/cameras.csv")

list.files("./testy1")

#default for read table is tab
#quotes are often the biggest issue - setting quote = "" often helps
#if you're doing xls use read.xlsx - you need to define sheetindex here
#you can also pass variables to read only certain fields
cameraData <- read.table("./testy1/cameras.csv",sep = ",", header = TRUE)

head(cameraData)