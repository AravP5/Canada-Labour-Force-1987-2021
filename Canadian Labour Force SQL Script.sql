SELECT *
FROM Sandbox.dbo.labour_force_data -- We can see data on the Canadian Labour Force all the way from 1987 to 2021
;

SELECT DISTINCT National_Occupational_Classification_NOC
FROM Sandbox.dbo.labour_force_data -- Column showing all the different Occupational sectors/classifications

SELECT *
FROM Sandbox.dbo.labour_force_data
WHERE National_Occupational_Classification_NOC = 'Total, all occupations'
AND GEO = 'Canada'
AND Sex = 'Both sexes'
AND Labour_force_characteristics = 'Unemployment rate'
ORDER BY REF_DATE ASC -- Pulls a table containing the unemployment rate of Canadian Labour Force. I used Microsoft SandDance as a visualizer
                        -- to see the scatterplot of unemployment. It looked sinusoidal and seemed to contract and grow over time
;
SELECT DISTINCT Labour_force_characteristics
FROM Sandbox.dbo.labour_force_data
;

SELECT @@TRANCOUNT -- Is the code in the middle of a transaction or not

BEGIN TRAN; -- Using a transaction block to make sure that I can rollback the changes to the table if the commands are incorrect
UPDATE Sandbox.dbo.labour_force_data
SET VALUE = VALUE * 1000 -- Updating all values in the VALUE column by 1000 if the Labour_Force_Characteristic = Labour Force
WHERE Labour_force_characteristics = 'Labour force'
ROLLBACK
COMMIT;

SELECT *
FROM Sandbox.dbo.labour_force_data
WHERE Labour_force_characteristics = 'Labour Force' -- I could create tables for each province seoarately, but it is probably easier if I do that in RStudio

SELECT *
FROM [Labour Force Data]
WHERE GEO = 'Canada'
AND REF_DATE = 2021
AND Labour_force_characteristics = 'Labour force'
AND Sex = 'Both sexes' 

SELECT VECTOR, VALUE * 100 / 20385.30078125 as percentageoflabour  -- Testing the creation of a new table to join to the existing table for 2021 occupational data
FROM [Labour Force Data]
WHERE GEO = 'Canada'
AND REF_DATE = 2021
AND Labour_force_characteristics = 'Labour force'
AND Sex = 'Both sexes' 

SELECT *
FROM (SELECT * FROM [Labour Force Data]) as t1
INNER JOIN (SELECT VECTOR, VALUE * 100 / 20385 as percentageoflabour FROM [Labour Force Data]
WHERE GEO = 'Canada'
AND REF_DATE = 2021
AND Labour_force_characteristics = 'Labour force'
AND Sex = 'Both sexes') as t2
ON t1.VECTOR = t2.VECTOR
WHERE GEO = 'Canada'
AND REF_DATE = 2021
AND Labour_force_characteristics = 'Labour force'
AND Sex = 'Both sexes' 
