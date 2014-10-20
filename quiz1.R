getwd() #get working directory

fileUrl2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv" #define location of download file
setInternet2(use = TRUE) # use to let me download

#download the file to given location
download.file(fileUrl2, destfile = "./GitHub/cleaningdataR/americancommunity.csv") 


#read file into dataframe
df <- read.csv("./GitHub/cleaningdataR/americancommunity.csv",header = TRUE,quote = "\"'",dec = ".")

#group by and count
library(plyr)
count(df,"VAL")

#select a single field
df2 <- df[,c("VAL")]

head(df2) #select top records

NROW(df2)  #count records


#download excel file - not the difference in referencing the mode = wb
fileUrl3 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl3, destfile = "./GitHub/cleaningdataR/naturalgasprogram.xlsx", mode = "wb") 

#use libraty to select bits of xls
require(XLConnect)

dat <- readWorksheetFromFile("./GitHub/cleaningdataR/naturalgasprogram.xlsx",
                               sheet = "NGAP Sample Data", 
                               region = "G18:O23", header = TRUE)

sum(dat$Zip*dat$Ext,na.rm=T)


#now dowload xml
fileUrl4 <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"

install.packages("XML")
library(XML)
require(XML)

doc <- xmlTreeParse(fileUrl4,useInternal=TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
names(rootNode)
rootNode[[1]]
rootNode[[1]][[1]]
rootNode[[1]][[1]][[2]]

rootNode[[1]][[1]][[2]]

zipcodes <- xpathSApply(rootNode,"//zipcode",xmlValue)

#convert it to a dataframe
df <- data.frame(matrix(unlist(zipcodes), byrow=T))
filteredzips <-df[df$matrix.unlist.zipcodes...byrow...T. == '21231',]
NROW(filteredzips)



fileUrl5 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv "

download.file(fileUrl5, destfile = "./GitHub/cleaningdataR/microdata.csv") 


install.packages("data.table")
library("data.table")

DT <- fread("./GitHub/cleaningdataR/microdata.csv",header = TRUE)


mean(DT$pwgtp15,by=DT$SEX) # wrong
tapply(DT$pwgtp15,DT$SEX,mean)
rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2] # wrong
sapply(split(DT$pwgtp15,DT$SEX),mean)
mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)


 system.time( replicate(1000, DT[,mean(pwgtp15),by=SEX] ) )


 system.time( replicate(1000, tapply(DT$pwgtp15,DT$SEX,mean) ) )
 system.time( replicate(1000, sapply(split(DT$pwgtp15,DT$SEX),mean) ) )
 system.time( replicate(1000, mean(DT[DT$SEX==1,]$pwgtp15) ) )
 system.time( replicate(1000, mean(DT[DT$SEX==2,]$pwgtp15) ) )





