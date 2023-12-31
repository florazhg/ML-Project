##### ACP #####
library(FactoMineR)

# lire les donnees "voitures"
voitures <- read.table("./data/voitures", header = TRUE)
names(voitures)

## Q1 : pourcentage d'inertie expliquee par les 3 premiers facteurs ? par le premier plan factoriel ?

voitures.acp <- PCA(voitures, graph=F)

# on regarde les valeurs propres
voitures.acp$eig
# 94.7% de l'inertie est expliquée par les 3 premiers facteurs
# 88.7% de l'inertie est expliquée par le premier plan factoriel


## Q2 : interpretation des 2 axes principaux a partir des correlations des variables avec ces axes

# on trace le cercle de correlation
plot(voitures.acp,choix="var", cex=0.7)
# 1er axe factoriel : correlation negative entre acceleration et la puissance/cylindree
# 2e axe factoriel : effet taille, oppose les grosses voitures (en haut) aux petites voitures (en bas)


## Q3 : representez les individus sur le premier plan factoriel
plot(voitures.acp,choix="ind", cex=0.7)

## (a) : les individus sont ils bien representes sur le premier plan factoriel ?

# on regarde le cos2
voitures.acp$ind$cos2[,1:2]
# la plupart sont bien representees car nous avons 80-90%
# voitures mal representees : PEUGEOTRCZ et SUBARU


## (b) : quelles sont les caracteristiques des individus en haut du graphe ?
# les voitures en haut du graphe sont les grosses voitures : lourdes, longues et larges

## (c) : quelles sont les caracteristiques des individus a droite du graphe ?
# voiture de sport : vitesse elevee


## (d) quelles sont les caracteristiques des individus en bas a gauche du graphe ?
# petites voitures a vitesse faible, acceleration elevee 


## (e) : PEUGEOTRCZ et JAGUARF ont-ils un profil semblable ? Si oui, quel est-il ?
# Non car PEUGEOTRZ est mal represente sur le premier plan factoriel
voitures[4:5,]


## (f) : LANCIA et LANDOVER ont-ils un profil semblable ? Si oui, quel est-il ?
# oui car ils sont bien representes -> ce sont des grosses voitures

## (g) interpretez la representation graphique des individus
# le premier composant explique 69.37% de la variance des voitures
# le deuxieme composant explique 19.38% de la variance des voitures 
# Les individus comme Renaultcaptur, Renaultsclio, Fiat500 sont similaires et ont des acélération elevee avec une puissance et vitesse plutot faibles
# --> ils se situent a proximité de la 2eme composante, donc fortement corrélée
# les individus se situant en bas a droite du graphique comme Ferrari et Fordmustang, qui ont un profil semblable possède un cylindre? élevée avec une vitesse et émision de CO2 élevés
