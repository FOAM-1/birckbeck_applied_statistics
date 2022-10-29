
# ths is where the data is stored
path <- "C:/Users/James/Documents/GitHub/birckbeck_applied_statistics/Year1/Statistical Analysis/Data/oil.txt"

# load in the data
data <- read.csv2(path, header = FALSE, sep="\t")

colnames(data) <- c("yield", "gravity", "pressure", "ASTM", "pet_frac")

data$yield <- as.numeric(data$yield)
data$gravity <- as.numeric(data$gravity)
data$pressure <- as.numeric(data$pressure)
data$ASTM <- as.numeric(data$ASTM)
data$pet_frac <- as.numeric(data$pet_frac)



# get the first few rows of data
print(head(data))

# get the column names of the data frame as a list
cols <- c("gravity", "pressure", "ASTM", "pet_frac")

# scatter plot of each column with the first column
for (col in cols) {
  plot(data[, c(col)], data$yield, xlab = col, ylab = "yield")
}

# this loops through the columns and makes box plots of each
for (col in cols) {
  boxplot(data[, c(col)])
}

oil_ex4b.lm <- lm(yield ~ ASTM + pet_frac, data = data, subset = c(-32))



