#Conjoint Analysis

#Declaration of features and feature values
feature_names <- c("LENGTH","ILLUSTRATION","CLAPS")
feature_values <- list()
feature_values[[1]] <- c("2min", "7min", "20min")
feature_values[[2]] <- c("several images","one image", "no image")
feature_values[[3]] <- c("+500 claps", "less than 500 claps")
feature_values

#All concept generation
articles <- expand.grid(
  LENGTH=feature_values[[1]],
  ILLUSTRATION=feature_values[[2]],
  CLAPS=feature_values[[3]]
)
articles

library (conjoint)
maxNumberOfArticles = 8

#Selection of relevant concepts
selectedArticles <- caFactorialDesign(
  data=articles,
  type='fractional',
  cards=maxNumberOfArticles
)
selectedArticles

#Checking if selected concepts are relevant for study
corrSelectedArticles <- caEncodedDesign(selectedArticles)
corrSelectedArticles

#print(cor(corr_design_mails))
print(cor(corrSelectedArticles))

ranking = c(7/7,3/7,3/7,5/7,2/7,6/7,3/7,0/7)
Conjoint(ranking,selectedArticles,unlist(feature_values))
