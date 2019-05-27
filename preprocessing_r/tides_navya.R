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
# Split column Date into Month, Day and Year
data <- data %>% separate(Cleanup.Date, c("Year", "Month", "Day"), sep = "-")
head(data)
# ----------------------------------------
# Split column Zone into County, State and Country
data <- data %>% separate(Zone, c("County", "State_short", "Country_short"), sep = ", ")
head(data)
# ----------------------------------------
# Complete cases only
data<-data[complete.cases(data),]
head(data)
# -------------------------------------
# To filter for US
data_us<-filter(data, Country == "United States")
# -----------------------------------
# Group by Zone and State
data_zsy<-group_by(data_us, County, State_short, Year)
# ----------------------------------
#Function to get the total items collected per year
Get_total<-function(data_zsy){
  df_summary <- summarize(data_zsy, Total = round(sum(Total.Items.Collected),2))
}
df_total<-Get_total(data_zsy)
# ----------------------------------
# To write into csv file
write.csv(df_total, file = "Tides_summary.csv")