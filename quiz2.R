getwd() #get working directory

#Question 1

#Install librarys
install.packages("dplyr")
install.packages("httpuv")


#import required librarys
library(httr)
library(httpuv)
library(jsonlite)
library(dplyr)


# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
github <- oauth_endpoints("github")
github


# 2. Register an application at https://github.com/settings/applications;
#    Use any URL you would like for the homepage URL (http://github.com is fine)
#    and http://localhost:1410 as the callback url
#
#    Insert your client ID and secret below - if secret is omitted, it will
#    look it up in the GITHUB_CONSUMER_SECRET environmental variable.
myapp <- oauth_app("github", "c4c7454dab7892eb61ac", "1f9532c1e9f971d29b2118dc73096b74ac7f9538")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
content(req)

json1 = content(req)
json2 = jsonlite::fromJSON(toJSON(json1))
head(json2)

json2[json2$full_name == "jtleek/datasharing",] # 2013-11-07T13:25:07Z







fileUrlquiz2_1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv" #define location of download file
setInternet2(use = TRUE) # use to let me download

#download the file to given location
download.file(fileUrlquiz2_1, destfile = "./GitHub/cleaningdataR/commsurvey.csv") 


acs <- read.csv("commsurvey.csv",header = TRUE,quote = "\"'",dec = ".")


install.packages("sqldf")
library(sqldf)

sqldf("select pwgtp1 from acs")

sqldf("select pwgtp1 from acs where AGEP < 50")

sqldf("select distinct AGEP from acs")


#Now next set of questions - read in html

install.packages("httr")
library(httr); html2 = GET("http://biostat.jhsph.edu/~jleek/contact.html")

con = url("http://biostat.jhsph.edu/~jleek/contact.html")

htmlCode = readLines(con)
close(con)
htmlCode

nchar(htmlCode[10]) # 45
nchar(htmlCode[20]) # 31
nchar(htmlCode[30]) # 7
nchar(htmlCode[100]) # 25



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





 



