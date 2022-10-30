# load in all the files we need
library(glue) # lets us use f-string like comprehension


# path where the dataset is stored
path <- "C:/Users/James/Documents/GitHub/birckbeck_applied_statistics/Year1/Statistical Analysis/Data/sugar.txt"

# load in the data 
sugar <- read.csv(path, dec="\t", sep="\t")

print(head(sugar))

# get the column names as a list
cols <- colnames(sugar)

# lop through all the columns and convert the dtypes to numerics
for (col in cols){
  sugar[, c(col)] <- as.numeric(sugar[, c(col)])
}

# make a new column which is the natural log of consumption
sugar["lconsump"] = log(sugar$consump)

# loop through a list of columns, starting from column 2
for (col in colnames(sugar)[(2:3)]){
  plot(sugar[, c("price"), sugar[, c(col)]], xlab="price", ylab=col, main=glue("Plot of {col} vs Price"))
}


# fit the linear model for part c
model1.lm <- lm("lconsump ~ price", data = sugar)

# print the statsmodels tyle summary table
print(summary(model1.lm))

# get a prediction from the model
prediction = predict(model1.lm, newdata=data.frame("price"=c(6)))


# plot lconsump and price with the fitted regression line
plot(sugar$price, sugar$lconsump, xlab="price", ylab="lconsump", main=glue("Plot of {col} vs Price"))
abline(model1.lm)