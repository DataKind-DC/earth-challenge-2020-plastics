# Navya Mote 4/27/2019
library(tidyr)
# Read the Tidal data
data <- read.csv('TIDES_detailed_summary_earth.csv',fileEncoding="UTF-8-BOM")
head(data)
# ---------------------------------------
# Split column GPS into Latitude and Longitude
data <- data %>% separate(GPS, c("Latitude", "Longitude"), sep = ", ")
head(data)
# ----------------------------------------
# Complete cases only
data<-data[complete.cases(data),]
head(data)
# -------------------------------------
# To write into csv file
write.csv(data, file = "Tides.csv")