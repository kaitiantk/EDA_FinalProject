# Q4


NEI <- readRDS("../Coursera/course project 2_final/summarySCC_PM25.rds")
SCC <- readRDS("../Coursera/course project 2_final/Source_Classification_Code.rds")
dev.set(which=1)

# extract the SCC id
coal.scc.list <- SCC$SCC[grepl("Coal",SCC$EI.Sector, fixed=TRUE)]
coal.scc.list <- unique(coal.scc.list)

coal.data <- with(NEI, subset(NEI,SCC %in% coal.scc.list))
coal.emission.yr <- with(coal.data, data.frame(Emissions,year))
coal.emission.yr$year <- paste0(coal.emission.yr$year,"0101")

coal.emission.by.yr <- with(coal.emission.yr, aggregate(Emissions,list(year),sum))
names(coal.emission.by.yr) <- c("Year","Emission")
coal.emission.by.yr$Year <- with(coal.emission.by.yr, as.Date(Year,"%Y%m%d"))
x=coal.emission.by.yr$Year
y=coal.emission.by.yr$Emission

plot(x,y,pch=8,col="red",main="Coal-Related PM2.5 Emission in U.S. (Yr: 1999,2002,2005,2008)",ylab="Tons",xlab="Year")
png(file="../Coursera/course project 2_final/plot4.png")
plot(x,y,pch=8,col="red",main="Coal-Related PM2.5 Emission in U.S. (Yr: 1999,2002,2005,2008)",ylab="Tons",xlab="Year")
dev.off()