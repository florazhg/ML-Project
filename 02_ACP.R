##### ACP #####
library(FactoMineR)

# Importation des données
voitures <- read.table("/Users/florazheng/Library/CloudStorage/OneDrive-UniversitéParis1Panthéon-Sorbonne/M1 Ecostats/S1/sondages/Projet/donnees/voitures", header = TRUE,row.names=1)


## Q1 : pourcentage d'inertie expliquee par les 3 premiers facteurs
voitures.acp <- PCA(voitures,graph=F)

# valeurs propres
voitures.acp$eig
# 98.3% de l'inertie est expliquée par les 3 premiers facteurs
# 88.7% de l'inertie est expliquée par le premier facteur


## Q2 : interpretation des 2 axes principaux a partir des correlations des variables avec ces axes
plot(voitures.acp,choix="var", habillage=13, cex=0.7)
# premier axe
# positivement correlees : cylindree, puissance, poids, longueur, largeur, hauteur, coffre, prix



