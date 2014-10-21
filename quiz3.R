#Quiz 3

getwd() #get working directory
#Question 1

setInternet2(use = TRUE) # use to let me download
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv " #define location of download file

download.file(fileUrl, destfile = "americancommunity_micro.csv") 

#read file into dataframe
df <- read.csv("americancommunity_micro.csv",header = TRUE,quote = "\"'",dec = ".")

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

download.file(fileUrl2, mode = "wb",destfile = "jeff.jpg") 

jp <- readJPEG("jeff.jpg", native = TRUE)

# answer
quantile(jp,probs = c(.30, .80))

#can put into to csv to investigate
write.csv(jp,"jp.csv")


#Question 3
