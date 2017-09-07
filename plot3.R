Read_Data <- function(file) {
        unzip(file)
        data <- readRDS("summarySCC_PM25.rds")
        classifications <- readRDS("Source_Classification_Code.rds")
        library(ggplot2)
        dfone <- data[data$year %in% 1999:2008, ]
        dfone <- dfone[dfone$fips %in% "24510",]
        pointdf <- dfone[dfone$type %in% "POINT",]
        nonpointdf <- dfone[dfone$type %in% "NONPOINT",]
        onroaddf <- dfone[dfone$type %in% "ON-ROAD",]
        nonroaddf <- dfone[dfone$type %in% "NON-ROAD",]
        meanonepoint <- mean(pointdf$Emissions[pointdf$year==1999])
        meantwopoint <- mean(pointdf$Emissions[pointdf$year==2002])
        meanthreepoint <- mean(pointdf$Emissions[pointdf$year==2005])
        meanfourpoint <- mean(pointdf$Emissions[pointdf$year==2008])
        meanonenonpoint <- mean(nonpointdf$Emissions[nonpointdf$year==1999])
        meantwononpoint <- mean(nonpointdf$Emissions[nonpointdf$year==2002])
        meanthreenonpoint <- mean(nonpointdf$Emissions[nonpointdf$year==2005])
        meanfournonpoint <- mean(nonpointdf$Emissions[nonpointdf$year==2008])
        meanoneonroad <- mean(onroaddf$Emissions[onroaddf$year==1999])
        meantwoonroad <- mean(onroaddf$Emissions[onroaddf$year==2002])
        meanthreeonroad <- mean(onroaddf$Emissions[onroaddf$year==2005])
        meanfouronroad <- mean(onroaddf$Emissions[onroaddf$year==2008])
        meanonenonroad <- mean(nonroaddf$Emissions[nonroaddf$year==1999])
        meantwononroad <- mean(nonroaddf$Emissions[nonroaddf$year==2002])
        meanthreenonroad <- mean(nonroaddf$Emissions[nonroaddf$year==2005])
        meanfournonroad <- mean(nonroaddf$Emissions[nonroaddf$year==2008])
        pointsmeans <- c(meanonepoint,meantwopoint,meanthreepoint, meanfourpoint)
        nonpointmeans <- c(meanonenonpoint, meantwononpoint, meanthreenonpoint, meanfournonpoint)
        onroadmeans <- c(meanoneonroad, meantwoonroad, meanthreeonroad, meanfouronroad)
        nonroadmeans <- c(meanonenonroad, meantwononroad, meanthreenonroad, meanfournonroad)
        yearlist <- c(1999,2002, 2005, 2008)
        
        plotone <- qplot(x=yearlist, y = pointsmeans, geom = "line", color = "Point")
        plotone <- plotone + geom_line(aes(x=yearlist, y=nonpointmeans, color = "Nonpoint"))
        plotone <- plotone + geom_line(aes(x=yearlist, y=onroadmeans, color = "Onroad"))
        plotone <- plotone + geom_line(aes(x=yearlist, y=nonroadmeans, color = "Nonroad"))
        plotone <- plotone + guides(col = guide_legend(title = "Legend"))
        plotone <- plotone + ggtitle("Mean PM2.5 Over Time By Type")
        plotone <- plotone + ylab("Mean PM2.5 Emission")
        plotone <- plotone + xlab("Year")
        plotone
}