library(readr)
X103money_edu <-
  read_csv("D:/BIGDATA INFRO/homework_resource/103money_edu.csv",
           locale = locale())

X106money_edu <-
  read_csv("D:/BIGDATA INFRO/homework_resource/106money_edu.csv",
           locale = locale())

library(dplyr)

X103money_edu$`大學-薪資` <- gsub("—", NA, X103money_edu$`大學-薪資`)
X106money_edu$`大學-薪資` <- gsub("—", NA, X106money_edu$`大學-薪資`)
X103money_edu$`大學-薪資` <- as.numeric(X103money_edu$`大學-薪資`)
X106money_edu$`大學-薪資` <- as.numeric(X106money_edu$`大學-薪資`)

combine103_106 <-
  full_join(X103money_edu, X106money_edu, by = "大職業別")
combine103_106$大職業別  <- gsub("_", "、", combine103_106$大職業別)

combine103_106$compare <-
  c(combine103_106$`大學-薪資.y` / combine103_106$`大學-薪資.x`)

combine103_1061 <-
  combine103_106[order(combine103_106$compare, decreasing = T),] %>% filter(combine103_106$compare > 1)
View(combine103_1061)


combine103_106$fivepercent <- c(combine103_106$compare)
combine103_1062 <-
  combine103_106[order(combine103_106$fivepercent, decreasing = T),]%>%filter(combine103_106$compare > 1.05)
View(combine103_1062)

combine103_106$fivepercent <-
  strsplit(combine103_106$大職業別, "-") %>% sapply("[", 1)
table(combine103_106$fivepercent)






library(readr)
X103money_edu <-
  read_csv("D:/BIGDATA INFRO/homework_resource/103money_edu.csv",
           locale = locale())
View(X103money_edu)
library(dplyr)
##>100女生較多

X103money_edu$`大學-女/男` <- gsub("—|…", NA, X103money_edu$`大學-女/男`)
X103money_edu$`大學-女/男`<-as.numeric(X103money_edu$`大學-女/男`)

X103money_edu$`大學-薪資` <- gsub("—|…", NA, X103money_edu$`大學-薪資`)
X103money_edu$`大學-薪資`<-as.numeric(X103money_edu$`大學-薪資`)

table(X103money_edu$`大學-女/男`>100)
table(X103money_edu$`大學-女/男`<100)

X103money_edu<-filter(X103money_edu,c(X103money_edu$`大學-女/男`<100))
X103money_edu$`大學-女/男`<-X103money_edu$`大學-女/男`[order(X103money_edu$`大學-女/男`,decreasing=F)]
View(head(X103money_edu,10))

#####
X104money_edu <-
  read_csv("D:/BIGDATA INFRO/homework_resource/104money_edu.csv",
           locale = locale())
library(dplyr)
X104money_edu$`大學-女/男` <- gsub("—|…", NA, X104money_edu$`大學-女/男`)
X104money_edu$`大學-女/男`<-as.numeric(X104money_edu$`大學-女/男`)

X104money_edu$`大學-薪資` <- gsub("—|…", NA, X104money_edu$`大學-薪資`)
X104money_edu$`大學-薪資`<-as.numeric(X104money_edu$`大學-薪資`)

table(X104money_edu$`大學-女/男`>100)
table(X104money_edu$`大學-女/男`<100)
X104money_edu<-filter(X104money_edu,c(X104money_edu$`大學-女/男`<100))
X104money_edu$`大學-女/男`<-X104money_edu$`大學-女/男`[order(X104money_edu$`大學-女/男`,decreasing=F)]
View(head(X104money_edu,10))##男生多薪資
X104money_edu<-filter(X104money_edu,c(X104money_edu$`大學-女/男`<100))
X104money_edu$`大學-女/男`<-X104money_edu$`大學-女/男`[order(X104money_edu$`大學-女/男`,decreasing=T)]
View(head(X104money_edu,10))##女生多薪資



X105money_edu <-
  read_csv("D:/BIGDATA INFRO/homework_resource/105money_edu.csv",
           locale = locale())
library(dplyr)
X105money_edu$`大學-女/男` <- gsub("—|…", NA, X105money_edu$`大學-女/男`)
X105money_edu$`大學-女/男`<-as.numeric(X105money_edu$`大學-女/男`)

X105money_edu$`大學-薪資` <- gsub("—|…", NA, X105money_edu$`大學-薪資`)
X105money_edu$`大學-薪資`<-as.numeric(X105money_edu$`大學-薪資`)

table(X105money_edu$`大學-女/男`>100)
table(X105money_edu$`大學-女/男`<100)
####here
X105money_edu1<-X105money_edu[order(X105money_edu$`大學-女/男`,decreasing=F),]%>%filter(X105money_edu$`大學-女/男`<100)
View(head(X105money_edu,10))

X105money_edu$`大學-女/男`<-X105money_edu$`大學-女/男`[X105money_edu$`大學-女/男`>100]%>%
  X105money_edu$`大學-薪資`[order(X105money_edu$`大學-薪資`,decreasing=T)]
View(head(X104money_edu,10))



X104money_edu<-filter(X104money_edu,c(X104money_edu$`大學-女/男`<100))
X104money_edu$`大學-女/男`<-X104money_edu$`大學-女/男`[order(X104money_edu$`大學-女/男`,decreasing=T)]
View(head(X104money_edu,10))##104女生多薪資

X105money_edu<-filter(X105money_edu,c(X105money_edu$`大學-女/男`<100))
X105money_edu$`大學-女/男`<-X105money_edu$`大學-女/男`[order(X105money_edu$`大學-女/男`,decreasing=T)]
View(head(X105money_edu,10))##105女生多薪資

X106money_edu<-filter(X106money_edu,c(X106money_edu$`大學-女/男`<100))
X106money_edu$`大學-女/男`<-X106money_edu$`大學-女/男`[order(X106money_edu$`大學-女/男`,decreasing=T)]
View(head(X106money_edu,10))##106女生多薪資

###
X106money_edu <-
  read_csv("D:/BIGDATA INFRO/homework_resource/106money_edu.csv",
           locale = locale())
library(dplyr)
X106money_edu$`大學-薪資` <- gsub("—|…", NA, X106money_edu$`大學-薪資`)
X106money_edu$`大學-薪資` <- as.numeric(X106money_edu$`大學-薪資`)
X106money_edu$`研究所及以上-薪資` <-
  gsub("—|…", NA, X106money_edu$`研究所及以上-薪資`)
X106money_edu$`研究所及以上-薪資` <- as.numeric(X106money_edu$`研究所及以上-薪資`)
View(X106money_edu)

X106money_edu$degreepay1<-c(X106money_edu$`研究所及以上-薪資` / X106money_edu$`大學-薪資`)
X106money_edu1 <-
  X106money_edu[order(X106money_edu$degreepay1, decreasing = T), ] 
##knitr::kable(head(X106money_edu$degreepay1,10))  
View((head(X106money_edu1,10)))

####num4.HW
X106money_edu <-
  read_csv("D:/BIGDATA INFRO/homework_resource/106money_edu.csv",
           locale = locale())
library(dplyr)
X106money_edu$`大學-薪資` <- gsub("—|…", NA, X106money_edu$`大學-薪資`)
X106money_edu$`大學-薪資` <- as.numeric(X106money_edu$`大學-薪資`)
X106money_edu$`研究所及以上-薪資` <-
  gsub("—|…", NA, X106money_edu$`研究所及以上-薪資`)
X106money_edu$`研究所及以上-薪資` <- as.numeric(X106money_edu$`研究所及以上-薪資`)


ME <-
  filter(
    X106money_edu,
    大職業別 %in% c(
      "資訊及通訊傳播業",
      "資訊及通訊傳播業-專業人員",
      "藝術_娛樂及休閒服務業-專業人員",
      "藝術_娛樂及休閒服務業-技術員及助理專業人員"
    )
  )
View(ME)
ME$diffrerent<-c(ME$`研究所及以上-薪資`-ME$`大學-薪資`)

