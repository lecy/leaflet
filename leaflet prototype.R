


# install.packages( "leaflet" )

library( leaflet )



code.violations <- read.csv("https://raw.githubusercontent.com/subartle/orangespot/master/data/code%20violations.csv")

code.violations <- code.violations[ !( is.na(code.violations$lon) | is.na(code.violations$lat)) , ]



parcels <- read.csv( "https://raw.githubusercontent.com/hectorlca/Code-Violations/master/data/parcels.csv" )


dat <- merge( code.violations, parcels, by.x="Identifier", by.y="SBL", all.x=T )








dat <- code.violations



# dropping NAs from full code violation set

cv <- code.violations[ !( is.na(code.violations$lon) | is.na(code.violations$lat)) , ]

nrow( cv )




lat.lon <- code.violations[ c("lat","lon") ]

lat.lon <- na.omit( lat.lon )

dat <- lat.lon
 
 


syr.map <- leaflet(data=dat ) %>% 
     
            addProviderTiles("CartoDB.Positron", tileOptions(minZoom=10, maxZoom=17))  %>%
     
            setView(lng=-76.13, lat=43.03, zoom=13) %>%
     
            setMaxBounds(lng1=-75, lat1=41, lng2=-77,  lat2=45)

syr.map



# COLOR CODE POINTS

# highlight bed bugs

col.vec <- ifelse( dat$Complaint.Type == "Bed Bugs", "orange", NA )

addCircles( syr.map, lng = dat$lon, lat = dat$lat, col=col.vec )





addCircles( syr.map, lng = lat.lon$lon, lat = lat.lon$lat )










# SUBSET BY DATE



start.date <- "2014-01-01"

end.date <- "2015-01-01"

# subset












