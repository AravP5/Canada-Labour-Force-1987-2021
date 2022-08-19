# Canada-Labour-Force-1987-2021

Data taken from [Statistics Canada](statcan.gc.ca)

#Columns

* REF_DATE - Year the record is taken. This dataset stretches from 1987 to 2021

* GEO - Name of the dimension

* DGUID - An alphanumeric unique identifier for each geographic location or locale

* UOM - Unit of measurement

* UOM_ID - ID associated with a unit of measurement, referred to in an appendix table

* SCALAR_FACTOR - E.g. Units, Tens, Hundreds ... etc

* SCALAR_ID - Matched with appendix table

## Intro

This is a practice project where I analyse the datasets using MSSQL and R to identify and visualize trends of employment, job growth and others. The workflow of this project is to do some initial data exploration in Azure Data Studio with MSSQL followed by coding in R to visualize the data previously queried. The SQL portionb of the project includes making sure all the data is properly formatted and cleaned as well as queried properly.  One of the intial questions I explored were the job sector growths over the years to see which industries are at the forefront of expansion. Since the data is from 1987 to 2021, figures like unemployment, the rise of employment of women, the recession of 2008 and 2009, and COVID-19 impact all make noticeable impacts on the trends observed. Another interesting figure of note is the contraction and expansion of the Canadian economy which is mapped out along with unemployment is clearly observed as a sinusoidal curve.

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
