Read_Data <- function(file) {
        unzip(file)
        data <- readRDS("summarySCC_PM25.rds")
        classifications <- readRDS("Source_Classification_Code.rds")
        dfone <- data[data$year %in% c(1999,2002, 2005, 2008), ]
        meanone <- mean(dfone$Emissions[dfone$year==1999])
        meantwo <- mean(dfone$Emissions[dfone$year==2002])
        meanthree <- mean(dfone$Emissions[dfone$year==2005])
        meanfour <- mean(dfone$Emissions[dfone$year==2008])
        meanlist <- c(meanone,meantwo,meanthree,meanfour)
        yearlist <- c(1999,2002, 2005, 2008)
        plot(yearlist, meanlist, type = "l", main = "Average Emission Reading From 1999 To 2008", xlab = "Year", ylab = "PM2.5")
        
        
        
        
}