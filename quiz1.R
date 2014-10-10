getwd() #get working directory

fileUrl2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv" #define location of download file
setInternet2(use = TRUE) # use to let me download

#download the file to given location
download.file(fileUrl2, destfile = "./GitHub/cleaningdataR/americancommunity.csv") 


#read file into dataframe
df <- read.csv("./GitHub/cleaningdataR/americancommunity.csv",header = TRUE,quote = "\"'",dec = ".")

#group by and count
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
fileUrl4 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"

install.packages("XML")
require(XML)

#can't do https for some reason
xmlfile=xmlParse("http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml")
class(xmlfile)

xmltop = xmlRoot(xmlfile)

xmlName(xmltop) #give name of node, PubmedArticleSet
xmlSize(xmltop) #how many children in node, 1
xmlName(xmltop[[1]]) #name of root's childre


Madhu2012=ldply(xmlToList("http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"), data.frame)

head(Madhu2012)

doc = xmlInternalTreeParse("http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml")

src = xpathApply(doc, "//a[@href]", xmlGetAttr, "href")
xmlValue(node)



