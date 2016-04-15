


# install.packages( "leaflet" )

library( leaflet )



code.violations <- read.csv("https://raw.githubusercontent.com/subartle/orangespot/master/data/code%20violations.csv")

parcels <- read.csv( "https://raw.githubusercontent.com/hectorlca/Code-Violations/master/data/parcels.csv" )

dat <- merge( code.violations, parcels, by.x="Identifier", by.y="SBL", all.x=T )


dat <- code.violations




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

col.vec <- ifelse( cv$Complaint.Type == "Bed Bugs", "orange", NA )

addCircles( syr.map, lng = cv$lon, lat = cv$lat, col=col.vec )





addCircles( syr.map, lng = lat.lon$lon, lat = lat.lon$lat )








# crimes <- read.csv( "https://raw.githubusercontent.com/lecy/hedonic-prices/master/Data/lat.long.csv" )
#
# addCircles( syr.map, lng = crimes$lon, lat = crimes$lat )





# addCircles( l, lng = lon, lat = lat, radius = 10, layerId = NULL, group = NULL,
# stroke = TRUE, color = "#03F", weight = 5, opacity = 0.5, fill = TRUE,
# fillColor = color, fillOpacity = 0.2, dashArray = NULL, popup = NULL,
# options = pathOptions(), data = getMapData(map))















