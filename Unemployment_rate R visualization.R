library("tidyverse", "ggplot2", "ggrepel", "extrafont")

unemployment_rate <- read.csv('/Users/aravpradhan/Downloads/14100335-eng (1)/Unemployment rate.csv')

View(unemployment_rate)
is.data.frame(unemployment_rate)

unemployment_rate %>%
  ggplot(aes(x = REF_DATE, y = VALUE)) +
  geom_point(size = 0.75, shape = 0) +
  geom_line() +
  theme_bw() +
  labs(title = "Unemployment Rate 1987-2021", x = "Year", 
       y = "Unemployment(%)") +
  theme(text=element_text(family="Helvetica", size= 10))