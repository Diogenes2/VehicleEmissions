Read_Data <- function(file) {
        unzip(file)
        data <- readRDS("summarySCC_PM25.rds")
        classifications <- readRDS("Source_Classification_Code.rds")
        bmcdata <- data[data$fips %in% "24510",]
        yearlist <- c(1999,2002,2005,2008)
        vehicledata <- classifications[grepl("Vehicle", classifications$Short.Name),]
        ids <- bmcdata[bmcdata$SCC %in% vehicledata$SCC,]
        sumlist<- vector(mode = "numeric")
        for (i in c(1999,2002,2005,2008)){
                qq <- sum(ids$Emissions[ids$year == i])
                sumlist <- append(sumlist,qq)
                
        }
        plot(yearlist, sumlist, type = "l", xlab = "Year", ylab = "Vehicle Emissions", main = "Baltimore City Vehicle Emissions Over Time")
}