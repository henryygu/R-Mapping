if (!require("pacman")) install.packages("pacman")
pacman::p_load(sf,dplyr,ggplot2)



# ---- 1. Read the shapefile ----
# The shapefile folder should contain files like .shp, .dbf, .shx, etc.
shp <- st_read("shapefile")

# ---- 2. Read the CSV file ----
book1 <- read.csv("book1.csv", stringsAsFactors = FALSE)

# ---- 3. Join the data ----
joined <- shp %>%
  left_join(book1, by = c("ICB23CD" = "ICB24CD"))


# ---- 4. Plot the map ----
ggplot(joined) +
  geom_sf(aes(fill = Type_1_Departments_._Major_A.E), color = "white", size = 0.2) +
  theme_minimal()
