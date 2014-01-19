library(reshape2)
library(XML)
library(string)

unemployment <- function(filename, current_year){
  doc <- htmlParse(filename)
  tableNodes <- getNodeSet(doc, "//table")
  tb <- readHTMLTable(tableNodes[[1]])
  tb_complete <- tb[c(2, 4 ,6, 8, 10, 12),]
  names(tb_complete) <- as.vector(as.matrix(tb[1,]))
  names(tb_complete)[2] <- str_replace_all(names(tb_complete)[2], pattern="[ ]", replacement="")
  names(tb_complete)[3] <- str_replace_all(names(tb_complete)[3], pattern="[ ]", replacement="")
  names(tb_complete)[2] <- paste(names(tb_complete)[2], "-", (as.integer(current_year)-1), sep="")
  names(tb_complete)[3] <- paste(names(tb_complete)[3],"-", current_year, sep="")
  mdata <- melt(tb_complete, id=c("Residence"))
  names(mdata) <- c("borough", "date", "percentage")
  return(mdata)
}

getData <- function(current_year){
  if (is.numeric(current_year)| is.integer(current_year)) {
    current_year <- as.character(current_year)
  }
  filenames <- list.files(current_year, pattern="*.htm", full.names=TRUE)
  unemploy <- lapply(filenames, unemployment, current_year=current_year)
  data <- do.call("rbind", unemploy)
  return(data)
}

# set working directory before running all the codes. Subfolders  are named as current_year
setwd("C:/Users/t/Dropbox/pdf/Finance")
# current year is the year when the data was collected, not the year when the reports were published.
current_year <- "2013"
data <- getData(current_year)
write.csv(data, file="unemployment2013.csv")  # the file name must include csv extension


current_year <- "2012"
data <- getData(current_year)
write.csv(data, file="unemployment2012.csv") 