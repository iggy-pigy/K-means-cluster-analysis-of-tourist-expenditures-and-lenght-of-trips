#Read the data file
tourism_data <- read.csv("International visitors by country 2019.csv", header= TRUE)

#Inspect the dataset
names(tourism_data)
head(tourism_data)
tail(tourism_data)
summary(tourism_data)
str(tourism_data)
dim(tourism_data)

#Change column names
names(tourism_data)[1] <- "Country"
names(tourism_data)[2] <- "Avg_daily_expenditure_euro"
names(tourism_data)[3] <- "Avg_trip_length_days"
str(tourism_data)

#Check for missing ("...") values
apply(tourism_data, 2, function(x) any(x=="..."))

#Remove missing ("...") data points
tourism_data<-tourism_data[!(tourism_data$Avg_daily_expenditure_euro =="..." | tourism_data$Avg_trip_length_days=="..."),]
dim(tourism_data)
str(tourism_data)

tourism_data$Country <- as.factor(tourism_data$Country)

# Convert data type from character to numeric
tourism_data$Avg_daily_expenditure_euro <- as.numeric(tourism_data$Avg_daily_expenditure_euro)
tourism_data$Avg_trip_length_days <- as.numeric(tourism_data$Avg_trip_length_days)
str(tourism_data)

library(cluster)

#Plot data
plot(Avg_trip_length_days~Avg_daily_expenditure_euro, data =tourism_data)
with(tourism_data,text(Avg_trip_length_days~Avg_daily_expenditure_euro, labels=Country, pos=4,cex=.6))


