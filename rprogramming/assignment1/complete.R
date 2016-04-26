complete <- function(directory, id = 1:332) {
  
  completecases <- data.frame(row.names = c("id", "nobs"))
  
  files <- list.files(directory, full.names =  TRUE)
  for(i in id) {
    rawdata <- read.csv(files[i])
    if(rawdata[1,'ID'] %in% id) {
      cleandata <- rawdata[complete.cases(rawdata),]
      lid <- cleandata[1,'ID']
      if(!is.na(lid)){
        completecases <- rbind(completecases, c(lid,nrow(cleandata)))
      }
    }
  }
  names(completecases) <- c("id", "nobs")
  completecases
}