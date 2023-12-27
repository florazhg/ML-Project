##### ACP #####
library(FactoMineR)

# lire les donnees "voitures"
voitures <- read.table("./data/voitures", header = TRUE)
names(voitures)

## Q1 : pourcentage d'inertie expliquee par les 3 premiers facteurs
voitures.acp <- PCA(voitures, graph=F)

# valeurs propres
voitures.acp$eig
# 98.3% de l'inertie est expliquée par les 3 premiers facteurs ?
# 88.7% de l'inertie est expliquée par le premier facteur ?


## Q2 : interpretation des 2 axes principaux a partir des correlations des variables avec ces axes
plot(voitures.acp,choix="ind", cex=0.7)
plot(voitures.acp,choix="var", cex=0.7)




