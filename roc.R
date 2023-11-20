actualResult_SVM2_training = scan("roc_data/actual_SVM2_training.txt")
actualResult_SVM3_training = scan("roc_data/actual_SVM3_training.txt")
predict_SVM2_1333_training = scan("roc_data/predict_SVM2_1333_training.txt")
predict_SVM3_0_training = scan("roc_data/predict_SVM3_0_training.txt")
predict_SVM3_50_training = scan("roc_data/predict_SVM3_202_training.txt")

actualResult_SVM2_test = scan("roc_data/actual_SVM2_test.txt")
actualResult_SVM3_test = scan("roc_data/actual_SVM3_test.txt")
predict_SVM2_1333_test = scan("roc_data/predict_SVM2_1333_test.txt")
predict_SVM3_0_test = scan("roc_data/predict_SVM3_0_test.txt")
predict_SVM3_50_test = scan("roc_data/predict_SVM3_202_test.txt")

library(ggplot2)
library(pROC)

# Training set

#define object to plot and calculate AUC
rocobj_SVM2_1333_training <- roc(actualResult_SVM2_training, predict_SVM2_1333_training)
rocobj_SVM3_0_training <- roc(actualResult_SVM3_training, predict_SVM3_0_training)
rocobj_SVM3_50_training <- roc(actualResult_SVM3_training, predict_SVM3_50_training)
auc_SVM2_1333_training <- round(auc(actualResult_SVM2_training, predict_SVM2_1333_training),4)
auc_SVM3_0_training <- round(auc(actualResult_SVM3_training, predict_SVM3_0_training),4)
auc_SVM3_50_training <- round(auc(actualResult_SVM3_training, predict_SVM3_50_training),4)


# Assuming you have a list of ROC objects and AUC values
roc_list_training <- list(rocobj_SVM2_1333_training, rocobj_SVM3_0_training, rocobj_SVM3_50_training)
auc_values_training <- c(auc_SVM2_1333_training, auc_SVM3_0_training, auc_SVM3_50_training)
auc_labels_training <- c("SVM2(λ=1333) AUC =", "SVM3 (λ=0) AUC =", "SVM3 (λ=202) AUC =")

colors <- c('red', 'blue', 'green')  # Specify colors for each ROC curve
for (i in seq_along(roc_list_training)) {
  plot.roc(roc_list_training[[i]], col = colors[i], main = "Performance of different models in the training set", add = i > 1)
  text(0.4, 0.3 - 0.1 * i, paste(auc_labels_training[i], round(auc_values_training[i], 3)), col = colors[i], cex=0.6)
}

# Test set
rocobj_SVM2_1333_test <- roc(actualResult_SVM2_test, predict_SVM2_1333_test)
rocobj_SVM3_0_test <- roc(actualResult_SVM3_test, predict_SVM3_0_test)
rocobj_SVM3_50_test <- roc(actualResult_SVM3_test, predict_SVM3_50_test)
auc_SVM2_1333_test <- round(auc(actualResult_SVM2_test, predict_SVM2_1333_test),4)
auc_SVM3_0_test <- round(auc(actualResult_SVM3_test, predict_SVM3_0_test),4)
auc_SVM3_50_test <- round(auc(actualResult_SVM3_test, predict_SVM3_50_test),4)


# Assuming you have a list of ROC objects and AUC values
roc_list_test <- list(rocobj_SVM2_1333_test, rocobj_SVM3_0_test, rocobj_SVM3_50_test)
auc_values_test <- c(auc_SVM2_1333_test, auc_SVM3_0_test, auc_SVM3_50_test)
auc_labels_test <- c("SVM2(λ=1333) AUC =", "SVM3 (λ=0) AUC =", "SVM3 (λ=202) AUC =")

colors <- c('red', 'blue', 'green')  # Specify colors for each ROC curve
for (i in seq_along(roc_list_test)) {
  plot.roc(roc_list_test[[i]], col = colors[i], main = "Performance of different models in the test set", add = i > 1)
  text(0.4, 0.3 - 0.1 * i, paste(auc_labels_test[i], round(auc_values_test[i], 3)), col = colors[i], cex=0.6)
}