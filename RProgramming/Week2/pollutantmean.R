pollutantmean <- function(directory, pollutant, id = 1:332) {
  fullPath <- paste0("./", directory) ##assume we are working with subdirectory
  csvFiles <- list.files(path = fullPath, pattern="\\.csv", full.names = TRUE )[id]
  file_list <- vector('list', length=length(csvFiles)) 
  dataframe_list <- lapply(X=csvFiles, read.csv, header=TRUE) 
  names(dataframe_list) <- csvFiles 
  dataFrame <- do.call("rbind", dataframe_list)
  mean(dataFrame[ ,pollutant], na.rm=TRUE)
}
