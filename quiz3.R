#Quiz 3

# Remove everything from the workspace
rm(list = ls())

getwd() #get working directory
#Question 1

setInternet2(use = TRUE) # use to let me download
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv " #define location of download file

download.file(fileUrl, destfile = "./GitHub/cleaningdataR/americancommunity_micro.csv") 

#read file into dataframe
df <- read.csv("./GitHub/cleaningdataR/americancommunity_micro.csv",header = TRUE,quote = "\"'",dec = ".")

#head(df)
#Need to filter data
#ACR = 3
#AGS = 6

#filtereddf <- df[(df$ACR ==3 & df$AGS == 6),] 
#filtereddf
#this is wrong though as I need a vector of true and false

#agricultureLogical <- logical(df[(df$ACR ==3 & df$AGS == 6),])
#doesnt' work for some reason

agricultureLogical <-with(df, ACR == 3 & AGS == 6)

#answer
which(agricultureLogical)



#Question 2

#Install jpeg librarys
install.packages("jpeg")
library(jpeg)

#download file first

fileUrl2 <- "http://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"

download.file(fileUrl2, mode = "wb",destfile = "./GitHub/cleaningdataR/jeff.jpg") 

jp <- readJPEG("./GitHub/cleaningdataR/jeff.jpg", native = TRUE)

# answer
quantile(jp,probs = c(.30, .80))

#can put into to csv to investigate
write.csv(jp,"jp.csv")


#Question 3

#load first data set
fileUrl3 <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv" #define location of download file

download.file(fileUrl3, destfile = "./GitHub/cleaningdataR/GDP.csv") 

#read file into dataframe with some tidy up going on
#colIndex <- 1:4
df <- read.csv("./GitHub/cleaningdataR/GDP.csv",header = TRUE,quote = "\"",dec = ".",skip=3, nrows = 191)


#df_ordered <- df[order("Ranking"),]


#help(read.csv)
#tail(df_ordered)
#colnames(df)
#head(df)


#Load in 2nd dataset
fileUrl4 <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv" #define location of download file
download.file(fileUrl4, destfile = "./GitHub/cleaningdataR/Education.csv") 
df1 <- read.csv("./GitHub/cleaningdataR/Education.csv",header = TRUE,quote = "\"",dec = ".",)

head(df1)

#Join 2 datasets
m1 <- merge(df, df1, by.x = "X", by.y = "CountryCode")

#Filter down to the fields that are relevant

m1_filtered <- m1[,c("X","Ranking")]

m1_filtered

order.pop <- order(-m1_filtered$Ranking)

order.pop

m1_ordered <- m1_filtered[order.pop,]

#reset the order
rownames(m1_ordered) <- 1:nrow(m1_ordered)

#answer
m1_ordered


#Question 4
#Go back to big merged list
#strip out fields I need

head(m1)
m1_filtered2 <- m1[,c("X","Ranking","Long.Name","Income.Group")]

m1_filtered2

#Answer
by(m1_filtered2$Ranking,m1_filtered2$Income.Group,mean)



#Question5
#Can use m1 filtered as it has the right fields
head(m1_filtered2)

#Do this to see how many values fall into each bucket
quantile(m1_filtered2$Ranking,probs = c(.2,.4,.6, .8,1))

#Order data by rank ascending
order.pop2 <- order(m1_filtered2$Ranking)

m2_ordered <- m1_filtered2[order.pop2,]

#reset the order
rownames(m2_ordered) <- 1:nrow(m2_ordered)

#Filter records to only look at lower middle income
newdata <- m2_ordered[ which(m2_ordered$Income.Group=='Lower middle income'), ]



colnames(newdata)
head(newdata)
newdata[which(newdata$RAnking < 39),]




