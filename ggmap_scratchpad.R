# http://www.kevjohnson.org/making-maps-in-r-part-2/

# http://bcb.dfci.harvard.edu/~aedin/courses/R/CDC/maps.html

# https://wilkinsondarren.wordpress.com/tag/ggmap/
        
# https://dl.dropboxusercontent.com/u/24648660/ggmap%20useR%202012.pdf


# test of ggmap, can use lat/lon input or address
library(ggmap)

test_map <- ggmap(get_googlemap(center = "56 talmadge hill road, prospect, ct", maptype = "roadmap", 
                zoom = 14, size = c(600, 600), extent = normal, darken = 0))

attributes(test_map)
# get bounding box
test_map$data
test_map$labels

geocode("56 talmadge hill road, prospect, ct 06712")

# specify bounding box
# http://stat405.had.co.nz/ggmap.pdf
# "location also accepts numeric vectors of length four following the left/bottom/right/top convention." 
test_map$data
bb <- c(test_map$data[1, 1], test_map$data[2, 1], test_map$data[2, 1], test_map$data[2, 2])



# test of geocode to get lat/lon from address
# lat/lon must be input as a list to get_googlemap
lat_lon <- geocode("13107 fernedge road, silver spring, md 20906")
lat_lon2 <- c(lat_lon[ , 1], lat_lon[ , 2])

lat_lon5 <- c(lat_lon3[ , 1], lat_lon3[ , 2])

test_map2 <- ggmap(
        get_googlemap(
                center = lat_lon2, maptype = "roadmap", zoom = 14, size = c(600, 600), extent = normal,
                darken = 0)
)

# plot on a ggmap
lat_lon3 <- geocode("13120 fernedge road, silver spring, md 20906")

lat_lon_df1 <- rbind(lat_lon, lat_lon3)
lat_lon_df1 <- cbind(lat_lon_df1, data.frame(location = c("home", "neighbor")))
test_map2 + geom_point(data = lat_lon_df1, aes(x = lon, y = lat, fill = location), pch = 21, color = "black")

# if you try to add a point outside the bounds of the map, it will omit the point 

#Generate some data
long = c(-3.17904, -3.17765, -3.17486, -3.17183)
lat = c(55.92432, 55.92353, 55.92284, 55.92174)
who = c("Darren", "Rachel", "Johannes", "Romesh")
data = data.frame (long, lat, who)

map = ggmap(
        get_googlemap(
                center=c(-3.17486, 55.92284), 
                zoom=16, 
                maptype='hybrid', 
                scale = 2), 
        
        size = c(600, 600),
        extent='normal', 
        darken = 0)

map + geom_point (
        data = data,
        aes (
                x = long, 
                y = lat, 
                fill = factor (who)
        ), 
        pch = 21, 
        colour = "white", 
        size = 6
)



library(jsonlite)

# use google maps api to get json doc with general map data like address and lat/lon
# read url and convert to data.frame
document <- fromJSON(txt=url)


json <- "https://maps.googleapis.com/maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA&key=AIzaSyAFRrNIvdtUWpq70Jmf-igpya134X5h-WA"
document <- fromJSON(txt = json)
document
attributes(document)
str(document)

document$results$address_components
document$results$geometry$location$lat
document$results$geometry$location$lng


