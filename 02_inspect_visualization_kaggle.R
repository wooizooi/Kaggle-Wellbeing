library(dplyr)
library(ggplot2)
#detach("package:psych", unload = TRUE)

source("00_import_kaggle.r")
source("01_data_curation_kaggle.r")

library("plot3D")

# set the x, y, and z variables
x <- KA_sub$PLACES_VISITED
y <- KA_sub$FRUITS_VEGGIES
z <- KA_sub$WORK_LIFE_BALANCE_SCORE

# Compute the linear regression 
fit <- lm(z ~ x + y)

# create a grid from the x and y values (min to max) and predict values for every point
# this will become the regression plane
grid.lines = 40
x.pred <- seq(min(x), max(x), length.out = grid.lines)
y.pred <- seq(min(y), max(y), length.out = grid.lines)
xy <- expand.grid(x = x.pred, y = y.pred)
z.pred <- matrix(predict(fit, newdata = xy), 
                 nrow = grid.lines, ncol = grid.lines)

# create the fitted points for droplines to the surface
fitpoints <- predict(fit)

# scatter plot with regression plane
scatter3D(x, y, z, pch = 19, cex = 1,colvar = NULL, col="red", 
          theta = 30, phi = 20, bty="b",
          xlab = "PLACES_VISITED", ylab = "FRUITS_VEGGIES", zlab = "WORK_LIFE_BALANCE_SCORE",  
          surf = list(x = x.pred, y = y.pred, z = z.pred,  
                      facets = TRUE, fit = fitpoints, col=ramp.col (col = c("dodgerblue3","seagreen2"), n = 300, alpha=0.95), border="black"), main = "Kaggle")

# KA_sub %>%
#   ggplot(aes(x = FRUITS_VEGGIES, y = WORK_LIFE_BALANCE_SCORE)) +
#   geom_point(colour = "red")
# 
# KA_sub %>%
#   ggplot(aes(x = DAILY_STRESS, y = WORK_LIFE_BALANCE_SCORE)) +
#   geom_point(colour = "red")
# 
# KA_sub %>%
#   ggplot(aes(x = sqrt(DAILY_STRESS), y = sqrt(WORK_LIFE_BALANCE_SCORE))) +
#   geom_point(colour = "red") +
#   geom_smooth(method = "lm", fill = NA)