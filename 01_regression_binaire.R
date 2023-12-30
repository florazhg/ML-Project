##### REGRESSION BINAIRE #####
library(MASS)
library(rpart)
library(rpart.plot)

## Q1 : determiner le meilleur modele possible pour modeliser P(Y|X1,X2)

# lire les donnees simu.txt
simudf <- read.table("./data/simu.txt", header=TRUE)

# statistiques descriptives
head(simudf)
str(simudf)
summary(simudf)

# transformer Y en facteur car ne prend des valeurs que dans {1,2}
simudf$Y <- as.factor(simudf$Y)

---------------------------------------------
# regression logistique #
simudf.logit <- glm(Y ~ X1 + X2, data = simudf, family = binomial())
summary(simudf.logit)
# tous les parametres sont significatifs
# score AIC = 2609

# stepwise logistic regression BIC
simudf.BIC <- stepAIC(simudf.logit,direction="both",k=log(dim(simudf)[1]))
summary(simudf.BIC)

# stepwise logistic regression AIC
simudf.AIC <- stepAIC(simudf.logit,direction="both")
summary(simudf.AIC)

---------------------------------------------
# regression logistique avec interaction #
simudf.logit2 <- glm(Y ~ X1 + X2 + X1*X2, data = simudf, family = binomial())
summary(simudf.logit2)
# score AIC = 2608
# X1*X2 n'est pas significatif

# stepwise logistic regression BIC
simudf.BIC2 <- stepAIC(simudf.logit2,direction="both",k=log(dim(simudf)[1]))
summary(simudf.BIC2)

# stepwise logistic regression AIC
simudf.AIC2 <- stepAIC(simudf.logit2,direction="both")
summary(simudf.AIC2)

---------------------------------------------

## Q2 : utiliser le fichier "xsimutest" pour predire 1000 observations de la variable Y du fichier de test

# lire les donnees "xsimutest.txt"
simu.test <- read.table("./data/xsimutest.txt", header=TRUE)


---------------------------------------------
# PREDICTION AVEC MODELE DE REGRESSION LOGISTIQUE #

# on recupere les probabilites estimees de chaque obs
fitted.test <- predict(simudf.logit, simu.test, type = "response")

# seuil de classification
logit_predictions <- ifelse(fitted.test > 0.5, 1, 2) # si la proba > 0.5 alors on estime Y=1, sinon Y=2

# creation du fichier qui contient les predictions
write.table(logit_predictions, "logit_predictions.txt", row.names = FALSE, col.names = FALSE)



---------------------------------------------
#### TEST ARBRE DE CLASSIFICATION ####
tree <- rpart(Y ~ X1 + X2, data = simudf)
printcp(tree)
prp(tree)

pred <- predict(tree, simu.test, type = "class")

# creation du fichier qui contient les predictions par arbre de classification
write.table(pred, "class_predictions.txt", row.names = FALSE, col.names = FALSE)


---------------------------------------------
#### TEST RANDOM FOREST ####
library(randomForest)

set.seed(123)  # Pour avoir des resultats reproductibles

rf_model <- randomForest(Y ~ X1 + X2, data = simudf)

rf_predictions <- predict(rf_model, newdata = simu.test)

# changer les valeurs en type numerique
rf_predictions <- as.numeric(as.character(rf_predictions))

# creation du fichier qui contient les predictions par random forest
write.table(rf_predictions, "rf_predictions.txt", row.names = FALSE, col.names = FALSE)

