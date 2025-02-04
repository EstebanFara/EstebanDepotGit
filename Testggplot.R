#ggplot2
install.packages("ggplot2")
install.packages("dplyr")
library(ggplot2)
library(dplyr)
data("starwars")
starwars

head(starwars)


ggplot(starwars, aes(x = species, y = height, color = species)) +
  geom_point(size = 5, alpha = 0.7) +  
  labs(
    title = "Analyse de la taille des personnages de Star Wars",
    subtitle = "Comparaison par espèce",
    x = "",
    y = "Taille (cm)"
  ) +
  theme_minimal(base_size = 14) +  # Style minimaliste
  theme(
    text = element_text(color = "red"),  
    axis.text.x = element_text(angle = 45, hjust = 1, color = "black"), 
    axis.text.y = element_text(color = "black"), 
    legend.position = "right",  
    legend.text = element_text(color = "black"),
    panel.grid.major = element_line(color = "white", linetype = "dotted")  
  ) +
  scale_color_manual(values = rainbow(length(unique(starwars$species)))) 
