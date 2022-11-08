# Canada-Labour-Force-1987-2021

Data taken from [Statistics Canada](statcan.gc.ca)

# Columns

* REF_DATE - Year the record is taken. This dataset stretches from 1987 to 2021

* GEO - Name of the dimension

* DGUID - An alphanumeric unique identifier for each geographic location or locale

* UOM - Unit of measurement

* UOM_ID - ID associated with a unit of measurement, referred to in an appendix table

* SCALAR_FACTOR - E.g. Units, Tens, Hundreds ... etc

* SCALAR_ID - Matched with appendix table

## Intro

This is a practice project where I analyse the datasets using MSSQL and R to identify and visualize trends of employment, job growth and others. The workflow of this project is to do some initial data exploration in Azure Data Studio with MSSQL followed by coding in R to visualize the data previously queried. The SQL portionb of the project includes making sure all the data is properly formatted and cleaned as well as queried properly.  One of the intial questions I explored were the job sector growths over the years to see which industries are at the forefront of expansion. Since the data is from 1987 to 2021, figures like unemployment, the rise of employment of women, the recession of 2008 and 2009, and COVID-19 impact all make noticeable impacts on the trends observed. Another interesting figure of note is the contraction and expansion of the Canadian economy which is mapped out along with unemployment is clearly observed as a sinusoidal curve.

## Tabular Structure of labour_data

|Column_name|	Type|	Computed |Length|
|:--|:--|:--|:--|
|REF_DATE|	smallint	|no	|2|
|GEO|	nvarchar	|no	|100|
|DGUID|	nvarchar	|no	|100|
|Labour_force_characteristics|	nvarchar	|no	|100|
|National_Occupational_Classification_NOC|	nvarchar	|no	|200|
|Sex|	nvarchar	|no	|100|
|UOM|	nvarchar	|no	|100|
|UOM_ID|	tinyint	|no	|1|
|SCALAR_FACTOR|	nvarchar	|no	|100|
|SCALAR_ID|	tinyint	|no	|1|
|VECTOR| nvarchar	|no	|100|
|COORDINATE|	nvarchar	|no	|100|
|VALUE|	float	|no	|8|
|STATUS|	nvarchar	|no	|100|
|SYMBOL|	nvarchar	|no	|2|
|TERMINATED|	nvarchar	|no	|2|
|DECIMALS|	tinyint	|no	|1|


### Canadian Unemployment Rate

Using MSSQL in Azure Data Studio (ADS), the labour_force_characteristics were specified to be 'Unemployment Rate' and this was done for all occupations and both sexes per year. The resulting rows returned were then plugged into SandDance, a downloadable extension in ADS to see if any basic trends could be identified. To get a clearer look at the data, the unemployment subtable was exported as a CSV and coded in RStudio as a scatter plot.

  <img src="Unemployment Rate Plot" alt="Unemployment Rate Plot" width="800"/>

Canada in general has higher unemployment than its counterparts in the United States and Europe due to its high proportion of seasonal and coastal industries. Another reason as to why this is the case is due to the many insulated and isolated communities in Canada which makes it more difficult for job hirings and applicants to match up. There are many interesting points in the graph which can be discussed though. Due to the inflation high point in the early 1990s, the monetary and fiscal policies implemented by the Canadian government exacerbated this issue. The worlwide recession in 2008 is also reflected in Canada's unemployment rate, as it can be seen spiking up during that period. Lastly, the COVID-19 pandemic forced many business to close, raising unemployment to the highest since the 1990s. On the bright side, after a year of COVID-19, the economy seems to be recovering as more people are able to find jobs.


### Investigating job growth in certain occupational sectors

The data was imported and read into a data frame called `occupational_labour_force`. 

`read.csv(
  '/Users/aravpradhan/Downloads/14100335-eng (1)/Occupational Labour Force cleaned .csv')
View(occupational_labour_force)`

However, as seen from the table presented above, there were many columns of data present which had no use in the analysis. These columns could have been removed/dropped in ADS with MSSQL code with `DROP COLUMN`, but that was not done. Nevertheless, it is not difficult to drop columns in R, and using the `select()` function, the data was cleaned/trimmed down to only have 5 important columns of data for each entry. (This was actually done in multiple steps, with each subset reducing the amount of unneeded info/entries). The final data frame used for specific analysis was the `both_sexes_subset` which was used to create data frames for each NOC occupational sector.

`both_sexes_subset_major_22 <- both_sexes_subset[both_sexes_subset$National_Occupational_Classification_NOC %in% 'Technical occupations related to natural and applied sciences [22]',]`

`both_sexes_subset_major_0 <- both_sexes_subset[both_sexes_subset$National_Occupational_Classification_NOC %in% 'Management occupations [0]',]`

`both_sexes_subset_major_1 <- both_sexes_subset[both_sexes_subset$National_Occupational_Classification_NOC %in% 'Business, finance and administration occupations [1]',]`

`both_sexes_subset_major_2 <- both_sexes_subset[both_sexes_subset$National_Occupational_Classification_NOC %in% 'Natural and applied sciences and related occupations [2]',]`


The `subset()` function had to be used to plot each `both_sexes_subset' line on the ggplot graph, to filter and use only the rows where 'both_sexes_subset$GEO == "Canada"`. Also, each separate `geom_line()` layer of the graph was coloured to match its NOC Classification.

<img src="Job trends for specific sectors, 1987 - 2021, Canada" alt="Job trends for specific sectors, 1987 - 2021, Canada" width="800"/> 

What is interesting in this graph is that when the data begins in 1987, there are very few people employed in the natural sciences (blue), whereas white-collar management positions(green) are much higher. However, by 2021, job growth in the sciences has overtaken that of regular office-based management positions. This indicates the growing tech and scientific influence of progress, and in the future years is likely to grow even more. Perhaps this information should be used to inform highschoolers and other youth who would benefit greatly from learning of job trends to secure a carreer in a field which is both growing interesting to them.

### Highest Distribution of Occupational Sectors in all of Canada in 2021
<img src="2021 Canadian Workforce Distribution 2" alt="2021 Canadian Workforce Distribution 2" width="800"/> 

