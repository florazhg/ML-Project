##### REGRESSION BINAIRE #####

## Q1 : determiner le meilleur modele possible pour modeliser P(Y|X1,X2)

# lire les donnees simu.txt
simudf <- read.table("./data/simu.txt", header=T)

# statistiques descriptives
head(simudf)
str(simudf)
summary(simudf)

# transformer Y en facteur car ne prend des valeurs que dans {1,2}
simudf$Y <- as.factor(simudf$Y)

---------------------------------------------
# regression logistique
simudf.logit <- glm(Y ~ X1 + X2, data = simudf, family = binomial())
summary(simudf.logit)
# tous les parametres sont significatifs
# score AIC = 2609

# stepwise logistic regression BIC
library(MASS)
simudf.BIC <- stepAIC(simudf.logit,direction="both",k=log(dim(simudf)[1]))
summary(simudf.BIC)

# stepwise logistic regression AIC
simudf.AIC <- stepAIC(simudf.logit,direction="both")
summary(simudf.AIC)

---------------------------------------------
# regression logistique avec interaction
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

train.simu <- read.table("./data/xsimutest.txt", header=T)

# probabilites estimees de chaque obs
prob_predictions <- predict(simudf.logit, train.simu, type = "response")

# seuil de classification
class_predictions <- ifelse(prob_predictions > 0.5, 1, 2) # si c'est > 0.5 alors 1 sinon 2

# creation du fichier qui contient les predictions
write.table(class_predictions, "predictions.txt", row.names = FALSE, col.names = FALSE)



---------------------------------------------
#### TEST D'UN AUTRE MODELE : RANDOM FOREST ####
install.packages("randomForest")
library(randomForest)

# Diviser les données en ensemble d'entraînement et de test
set.seed(123)  # Pour la reproductibilité

rf_model <- randomForest(Y ~ X1 + X2, data = simudf, ntree = 500)
predictions <- predict(rf_model, newdata = train.simu)
str(predictions)
# changer les valeurs en type numerique
predictions <- as.numeric(as.character(predictions))
write.table(predictions, "predictionsRF.txt", row.names = FALSE, col.names = FALSE)
table(predictions)
