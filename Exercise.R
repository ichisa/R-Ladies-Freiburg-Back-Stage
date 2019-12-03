
library(nnet)


require(neuralnet)
require(nnet)
require(ggplot2)

wines <- read.csv("wines.csv")
names(wines) <- c("label",
                  "Alcohol",
                  "Malic_acid",
                  "Ash",
                  "Alcalinity_of_ash",
                  "Magnesium",
                  "Total_phenols",
                  "Flavanoids",
                  "Nonflavanoid_phenols",
                  "Proanthocyanins",
                  "Color_intensity",
                  "Hue",
                  "OD280_OD315_of_diluted_wines",
                  "Proline")

head(wines)

#Plot the data:e.g.:  X and y two different explanatory variables. Color the label. 



# The wine dataset the variable label contains three different labels: 1,2 and 3.

#   The usual practice, as far as I know, is to encode categorical variables as a “one hot” vector. For instance, if I had three classes, like in this case, I’d need to replace the label variable with three variables like these:
  
  #   l1,l2,l3
  #   1,0,0
  #   0,0,1
  #   ...



# Encode as a one hot vector multilabel data
wines_ <- cbind(wines[, 2:14], class.ind(as.factor(wines$label)))
# Set labels name
names(wines_) <- c(names(wines)[2:14],"l1","l2","l3") # we do not need the first column anymore - now we have the information in the "hot vector"

#Scale - Be carfull, only the predictors have to be scaled, not the "hot vector". (simmilar to the example of the presentation but subseting the right columns)


#Split training and test data - half data into training and half into test



#Fit the model - choose the NN structure - Fit more than one so that you can compare

nn <- neuralnet(l1 + l2 + l3 ~ )


# plot the nn
# Evaluate the model: Create a matrix where it is possible to see which label each wine had and wich label was predicted by the model - use for this the test dataset

# Compute predictions
pr.nn <- compute(nn, test_[, 1:13])
  
#Let’s have a look at the accuracy on the training set:
  


# Extract results
pr.nn_ <- pr.nn$net.result
head(pr.nn_)

# Accuracy (training set)
original_values <- max.col(test_[, 14:16])
pr.nn_2 <- max.col(pr.nn_)
mean(pr.nn_2 == original_values)


# Exercise from: https://www.r-bloggers.com/multilabel-classification-with-neuralnet-package/
