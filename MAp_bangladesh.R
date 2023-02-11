library(tidyverse)
library(sf)
library(glue)
bd1 <- read_sf("C:\\Users\\W.C\\Downloads\\MAP_BD\\BGD_adm0.shp")
bd2 <- read_sf("C:\\Users\\W.C\\Downloads\\MAP_BD\\BGD_adm1.shp")
bd3 <- read_sf("C:\\Users\\W.C\\Downloads\\MAP_BD\\BGD_adm2.shp")
dat <- read.csv("C:\\Users\\W.C\\Downloads\\MAP_BD\\sp_dat.csv")
bd3
main_data <-  bd3 %>% 
  rename("District" = "NAME_2" ) %>% 
  left_join(dat, by = "District")

ggplot(main_data)+
  geom_sf(aes(fill=Proportion.of.OOP))+labs(title="District of Bangladesh",
                                            x="Longitude",y="Lattitude")
####### By district name

ggplot(main_data)+
  geom_sf(aes(fill=District))+labs(title="District of Bangladesh",
                                            x="Longitude",y="Lattitude")+
  geom_text(dat, mapping =  aes(long,lat, label = District),size = 2.5) + theme(legend.position = "none")         
  

