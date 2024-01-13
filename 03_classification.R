##### CLASSIFICATION  ####

# lire les donnees "voitures"
voitures <- read.table("./data/voitures", header=TRUE)

## Q1 : realisez une (ou des) classifications avec la methode des k-means et interpretez les resultats obtenus

# 2 clusters
km <- kmeans(voitures,2)
km
# la variance est trop basse : 62.8%

# 3 clusters
km <- kmeans(voitures,3)
km
# on peut encore ameliorer

# 4 clusters
km <- kmeans(voitures,4)
km
# satisfaisant

# on retrouve 4 classes (revoir les interpretations) :
# 1 : les voitures de ville qui sont peu puissantes avec un poids faible (Renaultclio, AudiA1, CitroenC4, etc)
# 2 : les voitures lourdes (Lancia, Landrover, Jaguarf)
# 3 : les voitures de sport avec une vitesse elevee et qui conso bcp (Fordmustang et Ferrari)
# 4 : voitures intermediaires electriques ??? (Volkswagen, Hyundai, Peugeotrcz, etc.)


## Q2 : faire une classification hierarchique avec la methode de "Ward". Interpretez le dendrogramme
# en cb de classe aurait-on envie de couper ce graphique ?
library("cluster")

hc <- hclust(dist(voitures),method = "ward.D")
hc
plot(hc)

# interpretations : on retrouve les memes resultats que pour les k-means
# on peut donc couper ce graphique en 4 classes
# de la gauche a la droite, on retrouve :
# classe 3 : voitures de sport
# classe 1 : voitures de ville
# classe 2 : voitures lourdes
# classe 4 : voitures intermediaires/electriques
