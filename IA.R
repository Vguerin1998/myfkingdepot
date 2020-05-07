library(ggplot2)
library(babynames) # provide the dataset: a dataframe called babynames
library(dplyr)
library("FactoMineR")
library("factoextra")

models <- read.csv("models.csv")

models$Dataset.d.entraînement <- NULL
models$Dataset.de.test <- NULL

#models$Nom <-paste(models$Noinstall.packages(c("FactoMineR", "factoextra"))mbre.de.neurones.dans.la.couche.complètement.connectée,models$Dataset.d.entraînement,sep=".")

# filter(models, Nom %in% c("128. catdog", "128.savane50", "128savane100", "512.savane100"))
# 
# # Plot
# models %>%
#   ggplot( aes(x=Nombre.passes, y=Pourcentage.de.réussite, group=Nom, color=Nom)) +
#   geom_line() +
# #  scale_color_viridis(discrete = TRUE) +
#   ggtitle("% de réussite en fonction du nombre de passes") +
#   ylab("% de réussites")

res.pca <- PCA(models, graph = TRUE)

eig.val <- res.pca$eig

plot(res.pca, choix = "ind", autoLab = "yes")

fviz_eig(res.pca, addlabels = TRUE, ylim = c(0, 60))

# Contributions des variables à PC1
fviz_contrib(res.pca, choice = "var", axes = 1, top = 10)
# Contributions des variables à PC2
fviz_contrib(res.pca, choice = "var", axes = 2, top = 10)