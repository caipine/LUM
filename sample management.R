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
