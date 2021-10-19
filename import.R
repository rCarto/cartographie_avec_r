library(mapsf)
library(sf)
com <- st_read("data/BDC_4-0_SHP_RGAF09UTM20_R02-ED201/ADMINISTRATIF/COMMUNE.shp")
dep <- st_read("data/BDC_4-0_SHP_RGAF09UTM20_R02-ED201/ADMINISTRATIF/DEPARTEMENT.shp")
zos <- st_read("data/BDC_4-0_SHP_RGAF09UTM20_R02-ED201/HABILLAGE/ZONE_OCCUPATION_SOL.shp")
river <- st_read("data/BDC_4-0_SHP_RGAF09UTM20_R02-ED201/HYDROGRAPHIE/TRONCON_HYDROGRAPHIQUE.shp")
xx <- st_read("data/BDC_4-0_SHP_RGAF09UTM20_R02-ED201/TOPONYMIE/ZONE_HABITAT_MAIRIE.shp")



mf_theme("nevermind")
mf_map(com)
mf_map(dep, col = NA, lwd = 2, add = TRUE)
mf_map(road, col = "red", lwd = 2, add = TRUE)
road
install.packages("foghorn")
(foghorn::cran_incoming())
library(foghorn)
cran_results(pkg="MASS")
a <- cran_details("mapsf")
cat(a$message, sep = "\n----------------\n")

foghorn::cran_results(email = "timothee.giraud@cnrs.fr")
mf_map(road, "VOCATION", "typo", add = T)

mf_map
road <- road[!road$NB_VOIES %in% "Sans objet",]
?mf_grad()
tt <- data.frame(NB_VOIES = c("Sans objet","1 voie ou 2 voies étroites", 
           "2 voies larges", "3 voies", "4 voies"), 
           SZ = c(5,1,2,3,4))
road <- merge(road, tt, by = "NB_VOIES")

mf_map(road, "SZ", "grad", breaks = c(0,1,2,3,4, 5), lwd = c(0.5,1,3,6, 12))
unique(road$ETAT)

unique(zz$NATURE)
mf_map(zz, "NATURE", type = "symb", pch = 16:20, cex = 2)


mf_map(river[river$ETAT=="Permanent",], add = T, col = "#0000ff")
mf_map(xx[xx$IMPORTANCE=="Chef-lieu de commune",], add = T, pch = 22, cex = 2)
mf_map(zos, var = "NATURE", type = "typo", border = NA, 
       pal = c('red', "purple", 
               "lightblue", 
               hcl.colors(6, "Greens")[1:5], 
               rep("grey", 2)), 
       val_order = c("Bâti", "Zone d'activités", 
                     "Eau libre", 
                     "Forêt", "Mangrove", "Prairie", "Vigne, verger", "Broussailles", 
                     "Sable, gravier","Rocher, éboulis"))


