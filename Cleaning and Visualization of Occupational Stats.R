library("tidyverse", "ggplot2", "ggrepel", "extrafont")
occupational_labour_force <- 
  read.csv(
  '/Users/aravpradhan/Downloads/14100335-eng (1)/Occupational Labour Force cleaned .csv')
View(occupational_labour_force)
is.data.frame(occupational_labour_force)

# Initial cleaning of data and dropping columns useless for all analysis
cleaned_occupational_stats = select(occupational_labour_force,
                                     -3, -4, -7:-12, -14, -15, -16, -17)

both_sexes_stats = select(cleaned_occupational_stats, )
View(filter(cleaned_occupational_stats, Sex == 'Both sexes')) # Will use filter() to choose subsets


filter(cleaned_occupational_stats, Sex == 'Both sexes')  %>%
  ggplot(aes(x = REF_DATE, Y = VALUE)) +
  geom_point(size = 0.75, shape = 0) +
  geom_line() +
  theme_bw()

both_sexes_subset <- cleaned_occupational_stats[cleaned_occupational_stats$Sex %in% 'Both sexes',]
view(both_sexes_subset) #Both sexes, 1987-2021 labour force for all sectors

both_sexes_subset_major_22 <- both_sexes_subset[both_sexes_subset$National_Occupational_Classification_NOC %in% 'Technical occupations related to natural and applied sciences [22]',]
both_sexes_subset_major_0 <- both_sexes_subset[both_sexes_subset$National_Occupational_Classification_NOC %in% 'Management occupations [0]',]
both_sexes_subset_major_1 <- both_sexes_subset[both_sexes_subset$National_Occupational_Classification_NOC %in% 'Business, finance and administration occupations [1]',]

view(subset(both_sexes_subset_major_0, GEO == 'Canada'))

ggplot() +
  geom_line(subset(both_sexes_subset_major_0, GEO == "Canada"), 
            mapping = aes(REF_DATE, VALUE, group = GEO, colour = "red")) +
  geom_line(subset(both_sexes_subset_major_1, GEO == "Canada"), 
            mapping = aes(REF_DATE, VALUE, group = GEO, colour = "orange")) +
  geom_line(subset(both_sexes_subset_major_22, GEO == "Canada"), 
            mapping = aes(REF_DATE, VALUE, group = GEO, colour = "yellow")) +
  theme_bw()




