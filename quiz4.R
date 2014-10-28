#Quiz4

getwd() #get working directory
setwd('C://Users//aurquhart//Documents//GitHub//cleaningdataR')
# OS X

#Question 1

#Point to file for download


setInternet2(use = TRUE) # use to let me download
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv" #define location of download file

download.file(fileUrl, destfile = "idaho_housing.csv") 

#read file into dataframe
df <- read.csv("idaho_housing.csv",header = TRUE,quote = "\"'",dec = ".")

#filter on just the field i want to split

df_wgtp = df$wgtp
#names(df)
#head(df)
splitNames = strsplit(names(df),"wgtp")

#Answer, assuming that there is no "." after "wgtp"
#splitNames[123]


#Question 2

#Load in GDP dataset
fileUrl2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv" #define location of download file

download.file(fileUrl2, destfile = "GDP_Data.csv") 

#read file into dataframe with some tidy up
df2 <- read.csv("GDP_Data.csv",header = TRUE,dec = ".",skip=4, nrows = 190)#191


#convert field with commas to number
#df2$X.4

col2cvt <- c('X.4')  # columns for conversion
for (i in col2cvt){
  df2[[i]] <- as.numeric(gsub(",", "", df2[[i]]))
}

#Answer
mean(df2$X.4)


#Question 3 - will try out some of the answers

grep("^United",df2$X.3), 3 #Think this is most right but don't understand ,3
grep("United$",df2$X.3), 3 #wrong

grep("^United",df2$X.3), 4
grep("*United",df2$X.3), 5


#Question 4

#Load data

https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv 

fileUrl4 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv" #define location of download file

download.file(fileUrl4, destfile = "GDP190.csv") 

#read file into dataframe
df4 <- read.csv("GDP190.csv",header = TRUE,dec = ".",skip=4, nrows = 190)#191
#head(df4)

#load 2nd dataset


fileUrl5 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv" #define location of download file

download.file(fileUrl5, destfile = "FED_Stats.csv") 

#read file into dataframe
df5 <- read.csv("FED_Stats.csv",header = TRUE,dec = ".")
#tail(df5)


#Join 2 datasets
m1 <- merge(df4, df5, by.x = "X", by.y = "CountryCode")

#head(m1$Special.Notes)

length(grep("*Fiscal year end: June",m1$Special.Notes))


#Question 5

#Use source code
#Install  librarys
install.packages("quantmod")

library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)



colnames(amzn)
class(amzn$AMZN.Open)
head(amzn$AMZN.Open)

substr(amzn$AMZN.Open,1,10) 
strtrim(amzn$AMZN.Open, 10)
format(amzn$AMZN.Open,"%a %b %d")
length(grep("*2012",amzn$AMZN.Open))
length(grep("*2012",sampleTimes))


head(sampleTimes)
