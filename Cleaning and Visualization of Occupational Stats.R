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
both_sexes_subset_major_2 <- both_sexes_subset[both_sexes_subset$National_Occupational_Classification_NOC %in% 'Natural and applied sciences and related occupations [2]',]
view(subset(both_sexes_subset_major_0, GEO == 'Canada'))

ggplot(data = NULL, aes(colour = National_Occupational_Classification_NOC)) +
  scale_y_continuous(name = 'No. of Jobs', breaks = seq(0, 1000000, by = 600)) +
  geom_line(subset(both_sexes_subset_major_0, GEO == "Canada"), 
            mapping = aes(REF_DATE, VALUE, group = GEO)) +
  geom_line(subset(both_sexes_subset_major_1, GEO == "Canada"), 
            mapping = aes(REF_DATE, VALUE, group = GEO)) +
  geom_line(subset(both_sexes_subset_major_22, GEO == "Canada"), 
            mapping = aes(REF_DATE, VALUE, group = GEO)) +
  geom_line(subset(both_sexes_subset_major_2, GEO == "Canada"), 
            mapping = aes(REF_DATE, VALUE, group = GEO)) +
  theme_bw() +
  facet_grid()
  

both_sexes_subset$VALUE = as.numeric(both_sexes_subset[,5])
is.numeric(both_sexes_subset_major_22$VALUE)
both_sexes_subset_canada <- subset(both_sexes_subset, GEO == "Canada")
view(both_sexes_subset_canada)

both_sexes_subset_canada %>%
  ggplot(aes(REF_DATE, VALUE, group = National_Occupational_Classification_NOC)) +
  geom_line() # Way too many different plots, will have to pick and choose occupations for analysis


view(cleaned_occupational_stats)
geo_canada_both_sexes <- cleaned_occupational_stats[cleaned_occupational_stats$GEO == 'Canada', ]
view(geo_canada_both_sexes)
both_sexes_subset_major_22 <- both_sexes_subset[both_sexes_subset$National_Occupational_Classification_NOC %in% 'Technical occupations related to natural and applied sciences [22]',]

ggplot(subset(geo_canada_both_sexes, Sex == 'Both sexes'), 
       aes(REF_DATE, VALUE, group = National_Occupational_Classification_NOC)) +
  geom_line()

 
both_sexes_subset_major_0$VALUE = as.numeric(both_sexes_subset_major_0$VALUE)
both_sexes_subset_major_1$VALUE = as.numeric(both_sexes_subset_major_1$VALUE)
both_sexes_subset_major_2$VALUE = as.numeric(both_sexes_subset_major_2$VALUE)
both_sexes_subset_major_22$VALUE = as.numeric(both_sexes_subset_major_22$VALUE)

ggplot(data = NULL, aes(group = data, colour = National_Occupational_Classification_NOC)) +
  geom_line(subset(both_sexes_subset_major_0, GEO == "Canada"), 
            mapping = aes(REF_DATE, VALUE, group = GEO,)) +
  ggtitle("Job Trends from 1987 - 2021", subtitle = "Data for All of Canada, certain occupational sectors selected") +
  xlab("Year") +
  ylab("No. of Jobs") +
  xlim(1987, 2021) +
  geom_line(subset(both_sexes_subset_major_1, GEO == "Canada"), 
            mapping = aes(REF_DATE, VALUE, group = GEO)) +
  geom_line(subset(both_sexes_subset_major_2, GEO == "Canada"), 
            mapping = aes(REF_DATE, VALUE, group = GEO)) +
  geom_line(subset(both_sexes_subset_major_22, GEO == "Canada"), 
            mapping = aes(REF_DATE, VALUE, group = GEO)) +
  scale_y_continuous(limits = c(200000, 4000000), name = "No. of Jobs in sector")
  
