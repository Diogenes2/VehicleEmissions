Read_Data <- function(file) {
        unzip(file)
        data <- readRDS("summarySCC_PM25.rds")
        classifications <- readRDS("Source_Classification_Code.rds")
        bmcdata <- data[data$fips %in% "24510",]
        caldata <- data[data$fips %in% "06037",]
        yearlist <- c(1999,2002,2005,2008)
        vehicledata <- classifications[grepl("Vehicle", classifications$Short.Name),]
        ids <- bmcdata[bmcdata$SCC %in% vehicledata$SCC,]
        sumlist<- vector(mode = "numeric")
        for (i in c(1999,2002,2005,2008)){
                qq <- sum(ids$Emissions[ids$year == i])
                sumlist <- append(sumlist,qq)
        }
        calids <- caldata[caldata$SCC %in% vehicledata$SCC,]
        csumlist<- vector(mode = "numeric")
        for (i in c(1999,2002,2005,2008)){
                qq <- sum(calids$Emissions[calids$year == i])
                csumlist <- append(csumlist,qq)
        }

        plot(yearlist, csumlist,xlab = "Year", ylab = "Sum of Vehicle Emissions", main = "Vehicle Emissions in Los Angeles County and Baltimore City", type = "l", col = "blue", ylim = c(0,1500), )
        lines(yearlist,sumlist, ylim = c(0,1500), col = "red")
        legend('topright', c("Los Angeles County", "Baltimore City"),lty=1, col=c('blue', 'red'), bty='n', cex=1.5)
        }