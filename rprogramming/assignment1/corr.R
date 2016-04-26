corr <- function(directory, threshold = 0) {
  
  pollutantdata <- c()
  for(file in list.files(directory, full.names =  TRUE)) {
    rawdata <- read.csv(file)
    completecases <- rawdata[complete.cases(rawdata), ]
    if(nrow(completecases) > threshold) {
      cleandata <- cor(completecases[,'nitrate'], completecases[,'sulfate'])
      pollutantdata <- append(pollutantdata, cleandata)
    }
  }
  
  pollutantdata
  
}