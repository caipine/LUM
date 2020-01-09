setwd("Y:/WL/R")
library('xlsx')
pdf_file <- "12-16-2019-151-2.pdf"
file1 <-    "12-16-2019-151-2.xlsx"

treatment <- c(151:180,"DMSO-1","DMSO-2")
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

y$percentage <- y$mean/((y$mean[31]+ y$mean[32])/2) #########################

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
y$percentage <- y$mean/ ((y$mean[31]+ y$mean[32])/2)   ###############################
y2 <- y[,1:3]
y3 <- transform(y2, SD=apply(y2,1, sd, na.rm = TRUE))

y$SD <- y3$SD
y$cell <- cells[i]
y

y_total <- rbind(y_total, y)

}
y_total

 y151 <- cbind(as.matrix(y_total$percentage[1:32]),
 as.matrix(y_total$percentage[33:64]), 
 as.matrix(y_total$percentage[65:96]), 
 as.matrix(y_total$percentage[97:128]), 
 as.matrix(y_total$percentage[129:160]), 
 as.matrix(y_total$percentage[161:192]), 
 as.matrix(y_total$percentage[193:224]), as.matrix(y_total$percentage[225:256]))
 
 rownames(y151) <- treatment
 colnames(y151) <- cells
 
 
 
 
 
 #^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 file1 <-    "12-20-2019-181-2.xlsx"

treatment <- c(181:210,"DMSO-1","DMSO-2")
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
y$percentage <- y$mean/ ((y$mean[31]+ y$mean[32])/2)   ###############################
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
y$percentage <- y$mean/ ((y$mean[31]+ y$mean[32])/2)   ###############################
y2 <- y[,1:3]
y3 <- transform(y2, SD=apply(y2,1, sd, na.rm = TRUE))

y$SD <- y3$SD
y$cell <- cells[i]
y

y_total <- rbind(y_total, y)

}


y_total

 y181 <- cbind(as.matrix(y_total$percentage[1:32]),
 as.matrix(y_total$percentage[33:64]), 
 as.matrix(y_total$percentage[65:96]), 
 as.matrix(y_total$percentage[97:128]), 
 as.matrix(y_total$percentage[129:160]), 
 as.matrix(y_total$percentage[161:192]), 
 as.matrix(y_total$percentage[193:224]), as.matrix(y_total$percentage[225:256]))
 
 rownames(y181) <- treatment
 colnames(y181) <- cells
 
 #<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
 
 file1 <-    "12-23-2019-211-2.xlsx"

treatment <- c(211:240,"DMSO-1","DMSO-2")
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
y$percentage <- y$mean/ ((y$mean[31]+ y$mean[32])/2)   ###############################

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
y$percentage <- y$mean/ ((y$mean[31]+ y$mean[32])/2)   ###############################

y2 <- y[,1:3]
y3 <- transform(y2, SD=apply(y2,1, sd, na.rm = TRUE))

y$SD <- y3$SD
y$cell <- cells[i]
y

y_total <- rbind(y_total, y)

}


y_total


 y211 <- cbind(as.matrix(y_total$percentage[1:32]),
 as.matrix(y_total$percentage[33:64]), 
 as.matrix(y_total$percentage[65:96]), 
 as.matrix(y_total$percentage[97:128]), 
 as.matrix(y_total$percentage[129:160]), 
 as.matrix(y_total$percentage[161:192]), 
 as.matrix(y_total$percentage[193:224]), as.matrix(y_total$percentage[225:256]))
 
 rownames(y211) <- treatment
 colnames(y211) <- cells
 
######$$$$$$$$$$$$$$$$$$$
file1 <-    "12-23-2019-241-2.xlsx"

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
y$percentage <- y$mean/ ((y$mean[31]+ y$mean[32])/2)   ###############################

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
y$percentage <- y$mean/ ((y$mean[31]+ y$mean[32])/2)   ###############################

y2 <- y[,1:3]
y3 <- transform(y2, SD=apply(y2,1, sd, na.rm = TRUE))

y$SD <- y3$SD
y$cell <- cells[i]
y

y_total <- rbind(y_total, y)

}


y_total

  y241 <- cbind(as.matrix(y_total$percentage[1:32]),
 as.matrix(y_total$percentage[33:64]), 
 as.matrix(y_total$percentage[65:96]), 
 as.matrix(y_total$percentage[97:128]), 
 as.matrix(y_total$percentage[129:160]), 
 as.matrix(y_total$percentage[161:192]), 
 as.matrix(y_total$percentage[193:224]), as.matrix(y_total$percentage[225:256]))
 
 rownames(y241) <- treatment
 colnames(y241) <- cells
###############

file1 <-    "12-30-2019-271-2.xlsx"

treatment <- c(271:299,"281-2","DMSO-1","DMSO-2")
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
y$percentage <- y$mean/ ((y$mean[31]+ y$mean[32])/2)   ###############################

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
y$percentage <- y$mean/ ((y$mean[31]+ y$mean[32])/2)   ###############################

y2 <- y[,1:3]
y3 <- transform(y2, SD=apply(y2,1, sd, na.rm = TRUE))

y$SD <- y3$SD
y$cell <- cells[i]
y

y_total <- rbind(y_total, y)

}


y_total

  y271 <- cbind(as.matrix(y_total$percentage[1:32]),
 as.matrix(y_total$percentage[33:64]), 
 as.matrix(y_total$percentage[65:96]), 
 as.matrix(y_total$percentage[97:128]), 
 as.matrix(y_total$percentage[129:160]), 
 as.matrix(y_total$percentage[161:192]), 
 as.matrix(y_total$percentage[193:224]), as.matrix(y_total$percentage[225:256]))
 
 rownames(y271) <- treatment
 colnames(y271) <- cells

dt <- rbind(y151[1:30,], y181[1:30,], y211[1:30,], y241[1:30,], y271[1:29,],)


heatmap(dt, scale="column")
 
 
 
