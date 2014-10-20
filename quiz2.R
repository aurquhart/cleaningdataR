getwd() #get working directory

fileUrlquiz2_1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv" #define location of download file
setInternet2(use = TRUE) # use to let me download

#download the file to given location
download.file(fileUrlquiz2_1, destfile = "./GitHub/cleaningdataR/commsurvey.csv") 


acs <- read.csv("./GitHub/cleaningdataR/commsurvey.csv",header = TRUE,quote = "\"'",dec = ".")


install.packages("sqldf")
library(sqldf)

sqldf("select pwgtp1 from acs")

sqldf("select pwgtp1 from acs where AGEP < 50")

sqldf("select distinct AGEP from acs")


#Now next set of questions - read in html

install.packages("httr")
library(httr); html2 = GET("http://biostat.jhsph.edu/~jleek/contact.html")
con = url("http://biostat.jhsph.edu/~jleek/contact.html")
content2 = content(html2,as="text")
parsedHtml = htmlParse(content2,asText=TRUE)
xpathSApply(parsedHtml, "//title", xmlValue)

capture.output(content2)
first <- capture.output(parsedHtml)[11]
nchar(first)

#try a different method
htmlCode2 = readLines(con)
capture.output(htmlCode2)
first <- capture.output(htmlCode2)[10]
nchar(first)



fileUrlquiz2_2 <- "http://biostat.jhsph.edu/~jleek/contact.html" #define location of download file
setInternet2(use = TRUE) # use to let me download


#ok try a 3rd method 
library(XML)
html3 <-htmlTreeParse(content2,useInternalNodes=T)
first <- capture.output(htmlCode3)[10]
nchar(first)





 



