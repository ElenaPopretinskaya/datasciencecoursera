complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  fullPath <- paste0("./", directory) ##assume we are working with subdirectory
  csvFiles <- list.files(path = fullPath, pattern="\\.csv", full.names = TRUE )[id]
  completeFunction <- function(csvName) sum(complete.cases(read.csv(csvName)))
  data.frame(id = id, nobs = unlist(lapply(csvFiles, completeFunction)))
  
}