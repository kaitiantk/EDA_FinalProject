
# Q2 -- Have total emissions from PM2.5 decreased in the Baltimore City, 
# Maryland (\color{red}{\verb|fips == "24510"|}fips == "24510") from 
# 1999 to 2008? Use the base plotting system to make a plot answering this question

NEI <- readRDS("../Coursera/course project 2_final/summarySCC_PM25.rds")
SCC <- readRDS("../Coursera/course project 2_final/Source_Classification_Code.rds")
dev.set(which=1)

baltimore.ma.data <- NEI[which(NEI$fips=="24510"),]
bm.emission.1999.vec <- with(baltimore.ma.data, subset(Emissions,year==1999))
bm.emission.1999 <- sum(bm.emission.1999.vec)
bm.emission.2002.vec <- with(baltimore.ma.data, subset(Emissions,year==2002))
bm.emission.2002 <- sum(bm.emission.2002.vec)
bm.emission.2005.vec <- with(baltimore.ma.data, subset(Emissions,year==2005))
bm.emission.2005 <- sum(bm.emission.2005.vec)
bm.emission.2008.vec <- with(baltimore.ma.data, subset(Emissions,year==2008))
bm.emission.2008 <- sum(bm.emission.2008.vec)
x=as.Date(c("19990101","20020101","20050101","20080101"),"%Y%m%d")
y=c(bm.emission.1999,bm.emission.2002,bm.emission.2005,bm.emission.2008)

plot(x,y,pch=8,col="red",main="Baltimore,MA PM2.5 Emission (Yr: 1999,2002,2005,2008)",ylab="Tons",xlab="Year")
png(file="../Coursera/course project 2_final/plot2.png")
plot(x,y,pch=8,col="red",main="Baltimore PM2.5 Emission (Yr: 1999,2002,2005,2008)",ylab="Tons",xlab="Year")
dev.off()