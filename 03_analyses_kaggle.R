#The Work-Life Balance Score is the total of all five categories: 
#a  poor score is below 550,  a good score is above 680, an excellent score is above 700.
# BMI_RANGE: Below 25: 1; Above 25: 2
source("C:\\Users\\Roethke\\Google Drive\\RESEARCH\\PROJEKTE\\IS Well-Being\\Uebung\\R\\Kaggle\\00_import_kaggle.r")
source("C:\\Users\\Roethke\\Google Drive\\RESEARCH\\PROJEKTE\\IS Well-Being\\Uebung\\R\\Kaggle\\01_data_curation_kaggle.r")
library("psych")
library("olsrr")


WLB.OLS = lm(WORK_LIFE_BALANCE_SCORE ~ FRUITS_VEGGIES + DAILY_STRESS + PLACES_VISITED + 
               CORE_CIRCLE + SUPPORTING_OTHERS + SOCIAL_NETWORK + ACHIEVEMENT + DONATION + 
               BMI_RANGE + TODO_COMPLETED + FLOW + DAILY_STEPS + LIVE_VISION + SLEEP_HOURS + 
               LOST_VACATION + DAILY_SHOUTING + SUFFICIENT_INCOME + PERSONAL_AWARDS + 
               TIME_FOR_PASSION + WEEKLY_MEDITATION + AGE + GENDER + YEAR, data = KA)

WLB.OLS = lm(WORK_LIFE_BALANCE_SCORE ~ FRUITS_VEGGIES + PLACES_VISITED +
               BMI_RANGE + LOST_VACATION + DAILY_SHOUTING + SUFFICIENT_INCOME + 
               GENDER + WINTER + YEAR + WEEKEND, data = KA)
summary(WLB.OLS)

#Full Collinearity Test: VIF < 3.3 (Kock, 2015);
ols_vif_tol(WLB.OLS)

WLB.OLS = lm(WORK_LIFE_BALANCE_SCORE ~ FRUITS_VEGGIES + 
              BMI_RANGE + TODO_COMPLETED + DAILY_STEPS + SLEEP_HOURS + 
              SUFFICIENT_INCOME + TIME_FOR_PASSION + WEEKLY_MEDITATION + 
               GENDER, data = KA_sub)

WLB.OLS = lm(WORK_LIFE_BALANCE_SCORE ~ AGE + GENDER + YEAR, data = KA_sub)

WLB.OLS = lm(WORK_LIFE_BALANCE_SCORE ~ FRUITS_VEGGIES + 
               BMI_RANGE + TODO_COMPLETED + DAILY_STEPS + 
               SUFFICIENT_INCOME + TIME_FOR_PASSION + WEEKLY_MEDITATION + 
               AGE + GENDER + YEAR, data = KA_sub)
summary(WLB.OLS)

# WLB.OLS = lm(WORK_LIFE_BALANCE_SCORE ~ FRUITS_VEGGIES + DAILY_STRESS + PLACES_VISITED + 
#                CORE_CIRCLE + SUPPORTING_OTHERS + SOCIAL_NETWORK + ACHIEVEMENT + DONATION + 
#                BMI_RANGE + TODO_COMPLETED + FLOW + DAILY_STEPS + LIVE_VISION + SLEEP_HOURS + 
#                LOST_VACATION + DAILY_SHOUTING + SUFFICIENT_INCOME + PERSONAL_AWARDS + 
#                TIME_FOR_PASSION + WEEKLY_MEDITATION + AGE + GENDER + YEAR, data = KA_sub)
# summary(WLB.OLS)


WLB.OLS = lm(WORK_LIFE_BALANCE_SCORE ~ FRUITS_VEGGIES + 
               PLACES_VISITED + AGE + GENDER + YEAR ,data = KA_sub)
summary(WLB.OLS)


new.data <- data.frame(
  FRUITS_VEGGIES = c(5, 0, 3), PLACES_VISITED = c(10,0,5), 
  AGE = as.factor(c("21 to 35","21 to 35","21 to 35")), 
  GENDER = as.factor(c("Male","Male","Male")), 
  YEAR = as.factor(c("2018","2018","2018"))
)

predict(WLB.OLS, newdata = new.data)
