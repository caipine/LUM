library('xlsx')

pdf_file <- "2019-05-13 AVA.pdf"

treatment <- c("postive control", "DMSO", "6965", "7367")
 file1 <- "2019-05-13 AVA.xlsx"
 Sheet1 <-  read.xlsx(file1, sheetName = "Sheet1")


x <- Sheet1
x1 <- x[1:8,2:4]
x1$treatment <- treatment[1]
x2 <- x[1:8,5:7]
x2$treatment <- treatment[2]
colnames(x2) <- colnames(x1)
x3 <- x[1:8,8:10]
x3$treatment <- treatment[3]
colnames(x3) <- colnames(x1)
x4 <- x[1:8,11:13]
x4$treatment <- treatment[4]
colnames(x4) <- colnames(x1)

y <-data.frame( rbind(x1,x2,x3,x4))
y$con <-as.factor( c(0,0.46875,0.9375,1.875,3.75,7.5,15,30))
y$mean <- rowMeans(y[,1:3])

y2 <- y[,1:3]
y3 <- transform(y2, SD=apply(y2,1, sd, na.rm = TRUE))

y$SD <- y3$SD
y$cell <- x[9,1]
y


y_total <- y




for (i in 2:8 ) {
x <-  read.xlsx(file1, sheetName = paste("Sheet",i, sep=''))


x1 <- x[1:8,2:4]
x1$treatment <- treatment[1]
x2 <- x[1:8,5:7]
x2$treatment <- treatment[2]
colnames(x2) <- colnames(x1)
x3 <- x[1:8,8:10]
x3$treatment <- treatment[3]
colnames(x3) <- colnames(x1)
x4 <- x[1:8,11:13]
x4$treatment <- treatment[4]
colnames(x4) <- colnames(x1)

y <-data.frame( rbind(x1,x2,x3,x4))
y$con <-as.factor( c(0,0.46875,0.9375,1.875,3.75,7.5,15,30))
y$mean <- rowMeans(y[,1:3])

y2 <- y[,1:3]
y3 <- transform(y2, SD=apply(y2,1, sd, na.rm = TRUE))

y$SD <- y3$SD
y$cell <- x[9,1]
y


y_total <- rbind(y_total, y)

}


y_total

library(ggplot2)
pdf(pdf_file,width=20,height=10)
ggplot(y_total,aes(x=con,y=mean,colour=treatment,group=treatment)) + 
  geom_errorbar(aes(ymin=mean-SD, 
                    ymax=mean+SD), width =.5)  +
  geom_line(aes(y = mean, group = treatment))  +
  xlab("Concentration") + 
  ylab("LUM") + 
  theme(strip.text = element_text(size=25)) +
facet_wrap( ~ cell , scales = "free_y", ncol = 4)

dev.off()
