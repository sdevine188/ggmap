library(ggmap)

test_map <- ggmap(
                get_googlemap(
                center = "56 talmadge hill road, prospect, ct", maptype = "roadmap", zoom = 14, size = c(600, 600), extent = normal,
                darken = 0)
        )

test_map + geom_point

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

deployApp("census-app")
