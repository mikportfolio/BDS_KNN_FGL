# Title : KNN_ForensicGlass
# Problem Statement: To predict six possible glass types
# By: mikportfolio, 241026 1500PM

# Install packages

# Import data "fgl" from "MASS" library
library(MASS) ## a library of example data sets
data(fgl) ## loads the data into R

# Plot data for the distribution of elemental composition of shards by glass type
par(mfrow=c(2,3))
plot(RI ~ type, data=fgl, col=c(grey(.2),2:6))
plot(Al ~ type, data=fgl, col=c(grey(.2),2:6))
plot(Na ~ type, data=fgl, col=c(grey(.2),2:6))
plot(Mg ~ type, data=fgl, col=c(grey(.2),2:6))
plot(Ba ~ type, data=fgl, col=c(grey(.2),2:6))
plot(Si ~ type, data=fgl, col=c(grey(.2),2:6))

# Scale Column 1 to Column 9 to centre values around mean with unit standard deviation
x <- scale(fgl[,1:9]) ## convert columns to mean-zero sd-one
apply(x,2,sd) # validate standardization

################
## Study 01   ##
################

## Use 214 training points to find nearest neighbors
library(class)
test <- sample(1:214,10)
nearest1 <- knn(train=x[-test,], test=x[test,], cl=fgl$type[-test], k=1)
nearest5 <- knn(train=x[-test,], test=x[test,], cl=fgl$type[-test], k=5)
data.frame(fgl$type[test],nearest1,nearest5)
