

NEI <- readRDS("../Coursera/course project 2_final/summarySCC_PM25.rds")
SCC <- readRDS("../Coursera/course project 2_final/Source_Classification_Code.rds")
dev.set(which=1)
# Q1 -- Have total emissions from PM2.5 decreased in the United States from 
# 1999 to 2008? Using the base plotting system, make a plot showing the 
# total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
emission_vec_1999 <- with(NEI, subset(Emissions,year==1999))
emission_1999 <- sum(emission_vec_1999)
emission_vec_2002 <- with(NEI, subset(Emissions,year==2002))
emission_2002 <- sum(emission_vec_2002)
emission_vec_2005 <- with(NEI, subset(Emissions,year==2005))
emission_2005 <- sum(emission_vec_2005)
emission_vec_2008 <- with(NEI, subset(Emissions,year==2008))
emission_2008 <- sum(emission_vec_2008)
x=as.Date(c("19990101","20020101","20050101","20080101"),"%Y%m%d")
y=c(emission_1999,emission_2002,emission_2005,emission_2008)

plot(x,y,pch=8,col="red",main="Total PM2.5 Emission (Yr: 1999,2002,2005,2008)",ylab="Tons",xlab="Year")
png(file="../Coursera/course project 2_final/plot1.png")
plot(x,y,pch=8,col="red",main="Total PM2.5 Emission (Yr: 1999,2002,2005,2008)",ylab="Tons",xlab="Year")
dev.off()
