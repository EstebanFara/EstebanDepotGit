############################################################################
############################################################################
###################  ANALYSES - INDICATEURS  ###############################
############################################################################
############################################################################

## Date : 15/11/2024 
## Auteur : ....

##########################################################################
########################### Fonction utiles ##############################
##########################################################################


# Installer le package (à faire une seule fois)
install.packages("tidyverse")
install.packages("reed_excel")


# Charger les packages
library(tidyverse)
library(readxl)  # Pour lire les fichiers Excel


#%>% 
#|> 
#read_excel()
#select() avec start_with() par exemple
#filter()
#mutate()
#fct_recode()
#group_by_()
#summarise()
#left_join() right_join() inner_join() full_join()
#pivot_longer() pivot_wider()
# ...


##########################################################################
########################### Import #######################################
##########################################################################

Sites <- read_excel("Sites.xlsx")
Microorga <- read_excel("Microorganismes.xlsx")
Nematodes <- read_excel("Nematodes.xlsx")
Vers <- read_excel("Lombrics.xlsx")


glimpse(Sites)
glimpse(Microorga)
glimpse(Nematodes)
glimpse(Vers)

##########################################################################
######################### Jointure de tables #############################
##########################################################################
########### CONSIGNE : Choisir deux communauté biologique ###########

#left_ join () right join () inner join () full join ()

Sites %>%
inner_join (., Microorga, join_by (ID) ) %>%
inner_join (., Nematodes, join_by (ID)) -> siteMN

##########################################################################
################## Sélection de lignes et colonnes ##################
##########################################################################
########### CONSIGNE : Choisir un site ###########

colnames(siteMN)


siteMN %>%
  filter(SITE == "Feucherolles") %>%
  select(SITE:REPET_BLOC, ARGILE, contains("SABLE"),
         ends_with("MIN"), PHYTO:CARNI) -> feMN

##########################################################################
####################### Créer des variables ##################
##########################################################################

glimpse(feMN)
colnames(feMN)

feMN %>%
  mutate(Phyto=(PHYTO/(PHYTO+BACT+FONG+OMNI+CARNI) ) * 100) -> FeMN2
        
View (FeMN2)

##########################################################################
############################## Calculs par groupe ########################
##########################################################################
########### CONSIGNE : calculs sur plusieurs variables en même temps######

FeMN2 %>%
  group_by(MODALITE_DESCR) %>%
  summarise(mean_Phyto=mean(Phyto), sd_Pp=sd)

##########################################################################
####################### Graphique ########################
##########################################################################
########### CONSIGNE : un graphique en modifiant l'ordre et en recodant des modalités


##########################################################################
######################## Pivots ##########################################
##########################################################################


##########################################################################
####################### Enchaîner tous les traitements ###################
##########################################################################

