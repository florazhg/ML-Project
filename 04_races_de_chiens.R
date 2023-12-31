##### RACES DE CHIENS #####

# lire les donnees "chiens"
chiens <- read.csv("data/chiens", header = TRUE, sep = " ")
names(chiens)

# tranformer les variables en variables qualitatives
chiens$TAI <- as.factor(chiens$TAI)
chiens$POI <- as.factor(chiens$POI)
chiens$VEL <- as.factor(chiens$VEL)
chiens$INT <- as.factor(chiens$INT)
chiens$AFF <- as.factor(chiens$AFF)
chiens$AGR <- as.factor(chiens$AGR)
chiens$FON <- as.factor(chiens$FON)

## Q1 : Analyse des correspondances multiples des donnees en utilisant FON comme variable supplementaire

library(FactoMineR)

# ACM
chiens.mca <- MCA(chiens, quali.sup=7, graph = FALSE)

# valeurs propres
chiens.mca$eig
# 65% de l'inertie est explique par le premier plan factoriel

plot(chiens.mca, choix="ind", cex=0.7)

plot(chiens.mca, choix="var", cex=0.7)

## Q2 : En deduire une description des differentes races de chiens



