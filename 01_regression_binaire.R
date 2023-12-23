##### REGRESSION BINAIRE #####

## Q1 : determiner le meilleur modele possible pour modeliser P(Y|X1,X2)

# lire les donnees simu.txt
simudf <- read.table("/Users/florazheng/Library/CloudStorage/OneDrive-UniversitéParis1Panthéon-Sorbonne/M1 Ecostats/S1/sondages/Projet/donnees/simu.txt", header=T)

# statistiques descriptives
head(simudf)
str(simudf)
summary(simudf)

# transformer Y en valeur binaire
simudf$Y <- ifelse(simudf$Y == 1, 1, 0) # remplacer les Y=2 par des 0
simudf$Y <- as.numeric(simudf$Y)

# regression logistique
simudf.logit <- glm(Y ~ X1 + X2, data = simudf, family = binomial(link = "logit"))
simudf.logit # AIC = 2609

# stepwise AIC
bestAIC = step(simudf.logit)
summary(bestAIC)

# critere BIC
library(MASS)
simudf.BIC <- stepAIC(simudf.logit, direction = "both", trace = FALSE)



## Q2 : utiliser le fichier "xsimutest" pour predire 1000 observations de la variable Y du fichier de test

simu.test <- read.table("/Users/florazheng/Library/CloudStorage/OneDrive-UniversitéParis1Panthéon-Sorbonne/M1 Ecostats/S1/sondages/Projet/donnees/xsimutest.txt", header=T)



