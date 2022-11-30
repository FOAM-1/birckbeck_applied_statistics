

# THIS IS WHERE THE DATA IS STORED
path <- "C:/Users/James/Documents/GitHub/birckbeck_applied_statistics/Year1/Statistical Analysis/Data/oil.txt"

# load in the data as a data frame
data <- read.csv2(path, sep="\t", header=FALSE)

# change the column names
colnames(data) <- c("spirit", "gravity", "pressure", "distil", "endpoint")

for (col in colnames(data)){
  data[, c(col)] <- as.numeric(data[, c(col)])
}
