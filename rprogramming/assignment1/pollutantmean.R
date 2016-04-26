pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  pollutantdata <- data.frame()
  for(file in list.files(directory, full.names =  TRUE)) {
    rawdata <- read.csv(file)
    cleandata <- rawdata[!is.na(rawdata[,pollutant]) & rawdata[,'ID'] %in% id, ]
    pollutantdata <- rbind(pollutantdata, cleandata)
  }
  
  mean(pollutantdata[,pollutant])
}