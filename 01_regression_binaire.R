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

# regression logistique
simudf.logit <- glm(Y ~ X1 + X2, data = simudf, family = binomial())
# score AIC = 2609

# BIC
library(MASS)
simudf.BIC <- stepAIC(simudf.logit,direction="both",k=log(dim(bdf)[1]))

simudf.AIC <- stepAIC(simudf.logit,direction="both",k=2)

# regression logistique 2
simudf.logit2 <- glm(Y ~ X1*X2, data = simudf, family = binomial())




## Q2 : utiliser le fichier "xsimutest" pour predire 1000 observations de la variable Y du fichier de test

simu.test <- read.table("./data/xsimutest.txt", header=T)



