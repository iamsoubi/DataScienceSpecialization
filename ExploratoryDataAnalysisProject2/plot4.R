# John Hopkins "Data Science Specialization"
===========================================
        
# Exploratory Data Analysis:Project 2 
====================================      
        
# Plot 4
--------
        
# Question 4:
# Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
        
# First,read the data file.
        
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

#  Create Data

CC <- grep("coal",SCC$EI.Sector,value=T,ignore.case=T)
SCC.CC <- subset(SRC, SCC$EI.Sector %in% CC, select=SCC)
NEI.CC <- subset(NEI, NEI$SCC %in%  SCC.CC$SCC)
pd <- aggregate(NEI.CC[c("Emissions")], list(year = NEI.CC$year), sum)

#  Create Plot

png('plot4.png', width=480, height=480)
p <- ggplot(pd, aes(x=year, y=Emissions)) +
        geom_point(alpha=.3) +
        geom_smooth(alpha=.2, size=1) +
        ggtitle("Total PM2.5 Coal Combustion Emissions in the US")
print(p)


dev.off()