library('xlsx')
setwd("Y:/WL/R")
file1 <- "Sample Box Map updated 20191220.xlsx"
Col_ID <- c("X", "A", "B", "C", "D", "E", "F", "G", "H", "I")
x<-  read.xlsx(file1, sheetName = "plasma")
x <- x[c(1:100,102:771),]


y <- x[1:10,1:10]
z <- data.frame(y[1:9,2]) 
colnames(z) <- "sample_ID"
z$Box_ID <- colnames(y)[1]
z$Col <- Col_ID[2]
z$Row <- c(1:9)


for (i in 3:10) {

zA <- data.frame(y[1:9,i]) 
colnames(zA) <- "sample_ID"
zA$Box_ID <- colnames(y)[1]
zA$Col <- Col_ID[i]
zA$Row <- c(1:9)
zA
z <- rbind(z, zA)
}

z_total <- z
z_total



for (j in 2:69) {
m <- x[(j*10-9):(j*10),1:10]


z <- data.frame(m[2:10,2]) 
colnames(z) <- "sample_ID"
z$Box_ID <- m[1,1]
z$Col <- Col_ID[2]
z$Row <- c(1:9)


for (i in 3:10) {

zA <- data.frame(m[2:10,i]) 
colnames(zA) <- "sample_ID"
zA$Box_ID <- m[1,1]
zA$Col <- Col_ID[i]
zA$Row <- c(1:9)
zA
z <- rbind(z, zA)
}

z_total <- rbind(z_total, z)

}
z_total



###################################
xlxs

#setwd("Y:/WL/R")
#library('xlsx')
#pdf_file <- "12-16-2019-151-2.pdf"
file2 <-    "2020-0110-s1.xlsx"
x<-  read.xlsx(file2, sheetName = "Sheet1")
xm <- x[,c(3,5:7)]

xmx <- cbind(xm, z_total)
xmx$SID <- 1:5589

p1<-  read.xlsx("P_Information_updated_20200109.xlsx", sheetName = "AllSamples") 

#p<-  read.xlsx("P_Information_updated_20200109.xlsx", sheetName = "Sheet3") 
#p<-  read.xlsx("ptinfo.xlsx", sheetName = "Sheet1") 

p <-  read.csv("ptinfo.csv") 
p <- p[order(p$TID),]
p1 <- p[duplicated(p$TID),]

p2<-  p[p$TID %in% p1$TID,]
p2[,1:20]
#p <- (p[,1:30]) 
test <- merge(xmx, p, by.x = "TID", by.y = "TID", all.x = TRUE)

#get sample failed merging
restSID <- xmx$SID[(xmx$SID %in% test$SID == F)]
restSID

#find row
rowID <- rownames(xmx)[(xmx$SID %in% restSID)]
t1 <- xmx[rowID,]
#not empty
t2 <- t1[!is.na(t1$TID) | !is.na(t1$MRN),]

