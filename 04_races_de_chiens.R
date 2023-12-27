##### RACES DE CHIENS #####

# lire les donnees "chiens"
chiens <- read.csv("data/chiens", header = TRUE, sep = " ")
names(chiens)

## Q1 : Analyse des correspondances multiples des donnees en utilisant FON comme variable supplementaire

library(FactoMineR)

# ACP
chiens.pca <- PCA(chiens, quanti.sup=7, graph = FALSE)

# regarder les valeurs propres
chiens.pca$eig

plot(chiens.pca, choix="ind", cex=0.7)

plot(chiens.pca, choix="var", cex=0.7)

## Q2 : En deduire une description des differentes races de chiens



