# John Hopkins "Data Science Specialization"
===========================================
        
# Exploratory Data Analysis : Project 2
=======================================      
        
# Plot 2
--------
        
# Question 2:
# Have total emissions from PM2.5 decreased in the Baltimore City, 
# Maryland (fips == "24510") from 1999 to 2008? Use the base plotting
# system to make a plot answering this question.
        
# First,read the data file.
        
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

#  Create Data

BC <- subset(NEI, fips == "24510")
pd <- aggregate(BC[c("Emissions")], list(year = BC$year), sum)

#  Create Plot

png('plot2.png', width=480, height=480)
plot(pd$year, pd$Emissions, type = "l", 
     main = "Total Emissions from PM2.5 in Baltimore City",
     xlab = "Year", ylab = "Emissions")
dev.off()
