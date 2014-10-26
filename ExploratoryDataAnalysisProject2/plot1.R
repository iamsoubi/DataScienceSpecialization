---
title: 'Exploratory Data Analysis:Project 2'
author: "sougata biswas"
date: "Saturday, August 23, 2014"
output: pdf_document
---
John Hopkins "Exploratory Data Analysis"
=======================================
        
Plot 1
======
        
Question 1:
Have total emissions from PM2.5 decreased in the United States from 1999 to
2008? Using the base plotting system, make a plot showing the total PM2.5
emission from all sources for each of the years 1999, 2002, 2005, and 2008.

First,read the data file.
-----------------------
        
```{r, echo=TRUE,eval=TRUE}
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")
```

Using tapply function.
--------------------
        
```{r, echo=TRUE,eval=TRUE}
totalPM25ByYear <- tapply(NEI$Emissions, NEI$year, sum)
```

Making Plot no 1
----------------
        
```{r, echo=TRUE,eval=TRUE}
png("plot1.png")
plot(names(totalPM25ByYear), totalPM25ByYear, type="l",
     xlab="Year", ylab=expression("Total" ~ PM[2.5] ~ "Emissions (tons)"),
     main=expression("Total US" ~ PM[2.5] ~ "Emissions by Year"))
dev.off()
```
