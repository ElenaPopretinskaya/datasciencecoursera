correlateCsv <- function(csvName) {
    dataFrame = read.csv(csvName)
    cor(dataFrame[,"nitrate"], dataFrame[,"sulfate"], "na.or.complete")
}
corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  fullPath <- paste0("./", directory) ##assume we are working with subdirectory
  csvFiles <- list.files(path = fullPath, pattern="\\.csv", full.names = TRUE )
  completeFunction <- function(csvName) sum(complete.cases(read.csv(csvName)))
  observationsDf <- data.frame(csvName = csvFiles, observations = unlist(lapply(csvFiles, completeFunction)))
  aboveThresholdObservations <- subset(observationsDf, observations > threshold)
  ##aboveThresholdObservations[1:2]
  result <- unlist(lapply(as.character(aboveThresholdObservations$csvName), correlateCsv))
  result <- if (is.null(result)) numeric() else result
}