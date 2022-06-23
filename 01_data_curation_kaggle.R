library(lubridate)

#data exploration
summary(KA)
hist(KA$WORK_LIFE_BALANCE_SCORE)
hist(KA$FRUITS_VEGGIES)
hist(KA$DAILY_STRESS)
hist(KA$PLACES_VISITED)
hist(KA$CORE_CIRCLE)
hist(KA$SUPPORTING_OTHERS)

#data curation
KA$Timestamp = parse_date_time(KA$Timestamp,"m/d/y")

KA$YEAR = numeric(length(KA$Timestamp))
KA$YEAR = format(KA$Timestamp, format = "%Y")
KA$YEAR = as.factor(KA$YEAR)

KA$MON = numeric(length(KA$Timestamp))
KA$MON[which(weekdays(KA$Timestamp)=="Monday")] = 1

KA$FRI = numeric(length(KA$Timestamp))
KA$FRI[which(weekdays(KA$Timestamp)=="Friday")] = 1

KA$WEEKEND = numeric(length(KA$Timestamp))
KA$WEEKEND[which(weekdays(KA$Timestamp)=="Saturday")] = 1
KA$WEEKEND[which(weekdays(KA$Timestamp)=="Sunday")] = 1

KA$WINTER = numeric(length(KA$Timestamp))
KA$WINTER[which(months(KA$Timestamp)=="December")] = 1
KA$WINTER[which(months(KA$Timestamp)=="January")] = 1
KA$WINTER[which(months(KA$Timestamp)=="February")] = 1

KA$SUMMER = numeric(length(KA$Timestamp))
KA$SUMMER[which(months(KA$Timestamp)=="June")] = 1
KA$SUMMER[which(months(KA$Timestamp)=="July")] = 1
KA$SUMMER[which(months(KA$Timestamp)=="August")] = 1

KA$AGE = as.factor(KA$AGE)
KA$GENDER = as.factor(KA$GENDER)


# KA$DAILY_STRESS[which(is.na(KA$DAILY_STRESS))] = median(KA$DAILY_STRESS)

# r sample dataframe; selecting a random subset in r
# df is a data frame; pick 5 rows
n = 400
KA_sub = KA[sample(nrow(KA), n), ]
rm(n)