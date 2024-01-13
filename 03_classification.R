##### CLASSIFICATION  ####

# lire les donnees "voitures"
voitures <- read.table("./data/voitures", header=TRUE)
nrow(voitures)

## Q1 : realisez une (ou des) classifications avec la methode des k-means et interpretez les resultats obtenus

# 2 clusters
km <- kmeans(voitures,2)
km
# la variance est trop basse : 62.8%

# 3 clusters
km <- kmeans(voitures,3)
km
# on retrouve 3 classes (revoir les interpretations) :
# 1 : les voitures sportives avec vitesses elevees, puissantes et consommant bcp (Fordmustang et Ferrari)
# 2 : les voitures de ville avec vitesses faibles, puissances faibles et consommant peu
# 3 : les voitures de ville avec vitesses moyennes, puissances moyennes et consommant moyennement

# 4 clusters
km <- kmeans(voitures,4)
km

## Q2 : faire une classification hierarchique avec la methode de "Ward". Interpretez le dendrogramme
# en cb de classe aurait-on envie de couper ce graphique ?
library("cluster")

hc <- hclust(dist(voitures),method = "ward.D")
hc
plot(hc)

# interpretations : on retrouve les memes resultats que pour les k-means
# on peut donc couper ce graphique en 3 classes
