SELECT *
FROM [Labour Force Data] -- We can see data on the Canadian Labour Force all the way from 1987 to 2021
;

SELECT DISTINCT National_Occupational_Classification_NOC
FROM [Labour Force Data] -- Column showing all the different Occupational sectors/classifications

SELECT *
FROM [Labour Force Data]
WHERE National_Occupational_Classification_NOC = 'Total, all occupations'
AND GEO = 'Canada'
AND Sex = 'Both sexes'
AND Labour_force_characteristics = 'Unemployment rate'
ORDER BY REF_DATE ASC -- Pulls a table containing the unemployment rate of Canadian Labour Force. I used Microsoft SandDance as a visualizer
                        -- to see the scatterplot of unemployment. It looked sinusoidal and seemed to contract and grow over time