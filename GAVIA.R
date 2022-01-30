# LIBRARIES----
library(tidyverse)
library(dplyr)
library(ggplot2)

#setup----
setwd("C:\\Users\\tmaso\\OneDrive\\Msc Environmental Management\\R\\GAVIA")
getwd()
# import data----
gavia<-read.csv("gavia.csv")

# exploration----
dim(gavia)
colnames(gavia)
View(gavia)
class(gavia)
ls
str(gavia)

# factors----
gavia$Order<-factor(gavia$Order)
gavia$Family<-factor(gavia$Family) 
gavia$Genus<-factor(gavia$Genus)
gavia$Species<-factor(gavia$Species)
gavia$Binomial<-factor(gavia$Binomial)
gavia$CommonName<-factor(gavia$CommonName)
gavia$CountryName<-factor(gavia$CountryName)
gavia$AreaName1<-factor(gavia$AreaName1)
gavia$AreaName2<-factor(gavia$AreaName2)
gavia$LocationDescription<-factor(gavia$LocationDescription)
gavia$Realm<-factor(gavia$Realm)
gavia$LandType<-factor(gavia$LandType)

summary(gavia$Family)

#subset SG----
gaviasg<-select(gavia,1:28) %>% 
  filter(CountryName=="SINGAPORE")

dim(gaviasg) #383 rows
colnames(gaviasg)

# species count----
sgfam<-gaviasg %>%
  count(Family) %>% 
  arrange(desc(n))
view(sgfam)

# Psittacidae ----
sgparrots<-select(gaviasg,1:28) %>% 
  filter(Family=="Psittacidae")
view(sgparrots)

sgspecies<-sgparrots %>% 
  count(CommonName) %>% 
  arrange(desc(n))

rrpnotes<-sgparrots %>% 
  select(CommonName,Notes,MappingDate) %>% 
  filter(CommonName=="Rose-ringed Parakeet") %>% 
  arrange(desc(MappingDate))
view(rrpnotes)
yccnotes<-sgparrots %>% 
  select(CommonName,Notes,MappingDate) %>% 
  filter(CommonName=="Yellow-crested Cockatoo") %>% 
  arrange(desc(MappingDate))
view(rrpnotes)
