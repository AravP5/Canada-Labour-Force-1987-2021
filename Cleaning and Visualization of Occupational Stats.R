library("tidyverse", "ggplot2", "ggrepel", "extrafont")
occupational_labour_force <- 
  read.csv(
  '/Users/aravpradhan/Downloads/14100335-eng (1)/Occupational Labour Force cleaned .csv')
View(occupational_labour_force)
is.data.frame(occupational_labour_force)

# Initial cleaning of data and dropping columns useless for all analysis
cleaned_occupational_stats = select(occupational_labour_force,
                                     -3, -4, -7:-12, -14, -15, -16, -17)
View(cleaned_occupational_stats)
View(filter(cleaned_occupational_stats, Sex == 'Both sexes')) # Will use filter() to choose subsets

filter(cleaned_occupational_stats, Sex == 'Both sexes')  %>%
  ggplot(aes(x = REF_DATE, Y = VALUE)) +
  geom_point(size = 0.75, shape = 0) +
  geom_line() +
  theme_bw()


