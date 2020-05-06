library(ggplot2)
library(babynames) # provide the dataset: a dataframe called babynames
library(dplyr)

#models <- read.csv("models.csv")

#models$Nom <-paste(models$Nombre.de.neurones.dans.la.couche.complètement.connectée,models$Dataset.d.entraînement,sep=".")

filter(models, Nom %in% c("128. catdog", "128.savane50", "128savane100", "512.savane100"))

# Plot
models %>%
  ggplot( aes(x=Nombre.passes, y=Pourcentage.de.réussite, group=Nom, color=Nom)) +
  geom_line() +
#  scale_color_viridis(discrete = TRUE) +
  ggtitle("% de réussite en fonction du nombre de passes") +
  ylab("% de réussites")
