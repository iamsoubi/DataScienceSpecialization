# John Hopkins "Data Science Specialization"
===========================================
        
# Exploratory Data Analysis : Project 2 
=======================================      
        
# Plot 5
--------
        
# Question 5:
# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
        
# First,read the data file.
        
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

# Assume "Motor Vehicles" only means on road

BaltimoreCityMV <- subset(NEI, fips == "24510" & type=="ON-ROAD")

BaltimoreMVPM25ByYear <- ddply(BaltimoreCityMV, .(year), function(x) sum(x$Emissions))
colnames(BaltimoreMVPM25ByYear)[2] <- "Emissions"

png("plot5.png")
qplot(year, Emissions, data=BaltimoreMVPM25ByYear, geom="line") +
        ggtitle(expression("Baltimore City" ~ PM[2.5] ~ "Motor Vehicle Emissions by Year")) +
        xlab("Year") +
        ylab(expression("Total" ~ PM[2.5] ~ "Emissions (tons)"))
dev.off()
