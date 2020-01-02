setwd("Y:/WL/R")
library('xlsx')
pdf_file <- "12-23-2019-241-20.pdf"
file1 <-    "12-23-2019-241-20.xlsx"

treatment <- c(241:270,"DMSO-1","DMSO-2")
cells <- c("REC1", "Mino", "Z138", "Jeko1", "Jeko-BTK-KO", "Maver", "Mino-R", "Rec-R")
#conc <-  c("20")


x<-  read.xlsx(file1, sheetName = "Sheet1")
x1 <- x[1:8,2:4]
x2 <- x[1:8,5:7]
colnames(x2) <- colnames(x1)
x3 <- x[1:8,8:10]
colnames(x3) <- colnames(x1)
x4 <- x[1:8,11:13]
colnames(x4) <- colnames(x1)

y <-data.frame( rbind(x1,x2,x3,x4))
#rownames(y) <- treatment

y$drug <- treatment
y$mean <- rowMeans(y[,1:3])

y2 <- y[,1:3]
y3 <- transform(y2, SD=apply(y2,1, sd, na.rm = TRUE))

y$SD <- y3$SD
y$cell <- cells[1]
y


y_total <- y




for (i in 2:8 ) {
x <-  read.xlsx(file1, sheetName = paste("Sheet",i, sep=''))
x1 <- x[1:8,2:4]
x2 <- x[1:8,5:7]
colnames(x2) <- colnames(x1)
x3 <- x[1:8,8:10]
colnames(x3) <- colnames(x1)
x4 <- x[1:8,11:13]
colnames(x4) <- colnames(x1)

y <-data.frame( rbind(x1,x2,x3,x4))
#rownames(y) <- treatment

y$drug <- treatment
y$mean <- rowMeans(y[,1:3])

y2 <- y[,1:3]
y3 <- transform(y2, SD=apply(y2,1, sd, na.rm = TRUE))

y$SD <- y3$SD
y$cell <- cells[i]
y

y_total <- rbind(y_total, y)

}


y_total


library(ggplot2)
pdf(pdf_file,width=20,height=10)
ggplot(data=y_total, aes(x=drug,y=mean)) +
  geom_bar(stat="identity")+
  geom_errorbar(aes(ymin=mean-SD, ymax=mean+SD), width =.5)  +
  theme(axis.text.x=element_text(size=10, angle=90,hjust=0.95,vjust=0.2))+
facet_wrap( ~ cell , scales = "free_y", ncol = 2)   
dev.off()



