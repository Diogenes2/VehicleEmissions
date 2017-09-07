Read_Data <- function(file) {
        unzip(file)
        data <- readRDS("summarySCC_PM25.rds")
        classifications <- readRDS("Source_Classification_Code.rds")
        coaldata <- classifications[grepl("Coal", classifications$Short.Name),]
        ids <- data[data$SCC %in% coaldata$SCC,]
        sumone <- sum(ids$Emissions[ids$year == 1999])
        sumtwo <- sum(ids$Emissions[ids$year == 2002])
        sumthree <- sum(ids$Emissions[ids$year == 2005])
        sumfour <- sum(ids$Emissions[ids$year == 2008])
        sumlist <- c(sumone,sumtwo,sumthree,sumfour)
        yearlist <- c(1999,2002, 2005, 2008)
        barplot(sumlist, names.arg = yearlist, xlab = "Year", ylab = "Coal Emissions", main = "Coal Emissions Across the United States Over Time" )
        
        
}