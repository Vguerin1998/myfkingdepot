library(ggplot2)
library(babynames) # provide the dataset: a dataframe called babynames
library(dplyr)
library("FactoMineR")
library("factoextra")
library(ade4)
library(shiny)

models <- read.csv("models.csv")

models$Dataset.d.entraînement <- NULL
models$Dataset.de.test <- NULL

models$Nom <-paste(models$Nombre.de.neurones.dans.la.couche.complètement.connectée,models$Dataset.d.entraînement,sep=".")

filter(models, Nombre.de.classes %in% c("9", "2"))
 
 # Plot
 models %>%
   ggplot( aes(x=Nombre.de.classes, y=Pourcentage.de.réussite, group=Nombre.de.classes, color=Nombre.de.classes)) +
   geom_line() +
   ggtitle("% de réussite en fonction du nombre de passes") +
   ylab("% de réussites")

 op <- par(bg = "lightgrey", fg = "white", lwd = 2)
 
 plot(models$Nombre.de.classes, models$Pourcentage.de.réussite,  
      pch = 20, cex = 0.8, col = "red", 
      xlab = "Nombre de classes",
      ylab = "% de réussite")
 
 lines(lowess(models$Nombre.de.classes, models$Pourcentage.de.réussite), col = "black")
 title("% de réussite en fonction du nombre de classes")  
 

 res.pca <- PCA(models, graph = TRUE)
 
 eig.val <- res.pca$eig
 
 plot(res.pca, choix = "ind", autoLab = "yes")
 
 fviz_eig(res.pca, addlabels = TRUE, ylim = c(0, 60))
 
 # Contributions des variables à PC1
 fviz_contrib(res.pca, choice = "var", axes = 1, top = 10)
 # Contributions des variables à PC2
 fviz_contrib(res.pca, choice = "var", axes = 2, top = 10)
 fviz_contrib(res.pca, choice = "var", axes = 2, top = 10)
 fviz_pca_var(res.pca, col.var = "black", title="ACP des corrélations entre les variables")
 
 acp2 <- dudi.pca(models , scannf= F,scale=FALSE,,nf=3)
 s.corcircle(acp2$c1, xax = 1, yax = 2);mtext("Variabilité sur les axes 1 et 2")
 s.label(acp2$li, xax = 2, yax = 3);mtext("Variabilité sur les axes 2 et 3")
 s.corcircle(acp2$c1, xax = 2, yax = 3);mtext("Variabilité sur les axes 2 et 3")
 