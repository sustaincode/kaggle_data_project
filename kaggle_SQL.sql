show tables;

SELECT *
FROM main.vgsales v;

SELECT  Genre, v.Platform  
FROM main.vgsales v;

--Provide reco for game dev and pub on which genres and platforms to focus on for max global sales
-- 31 - paltforms
-- 12 Genre

SELECT sum(Global_Sales) AS Sales, v.Year 
FROM kaggle_vg.main.vgsales v
GROUP BY YEAR;
--WHERE Sum (Global_Sales) YEAR ='N/A';

--Find out the annual global sales grouped by Year
SELECT YEAR, sum(Global_sales) AS Yr_Sales
FROM Main.vgsales v
GROUP BY v.YEAR 
ORDER BY Yr_Sales DESC;
-- Findings Lots of inconsistance in global sales data there from Year 2020 and 2017. Close to 100.08 amout of data does not have year field.

--Genre vs Annual Global Sales
SELECT Genre, sum(Global_sales) AS Yr_Sales
FROM kaggle_vg.main.vgsales v 
GROUP BY Genre 
ORDER BY Yr_Sales DESC ;

-- Platform vs annual global sales
SELECT Platform, sum(Global_sales) AS Yr_Sales
FROM kaggle_vg.main.vgsales v 
GROUP BY Platform 
ORDER BY Yr_Sales DESC ;


-- 2008 Platform vs global sales
SELECT  platform,sum(Global_sales) AS Yr_Sales
FROM vgsales
WHERE YEAR = '2008'
GROUP BY platform
ORDER BY Yr_Sales DESC, platform DESC;

-- 2008 Genre vs Global sales
SELECT  Genre,sum(Global_sales) AS Yr_Sales
FROM vgsales
WHERE YEAR = '2008'
GROUP BY Genre
ORDER BY Yr_Sales DESC, Genre DESC;

-- 2008 Platform, genre vs global sales
SELECT  Platform, Genre,sum(Global_sales) AS Yr_Sales
FROM vgsales
WHERE YEAR = '2008'
GROUP BY Platform, Genre
ORDER BY Yr_Sales DESC, platform DESC;


--Genre platform and platform as a mode bit confusing
SELECT DISTINCT Genre, sum(global_sales) AS Yr_sales
FROM kaggle_vg.main.vgsales v
GROUP BY Genre; 


SELECT YEAR, count(year) AS No_Of_Records
FROM main.vgsales v
GROUP BY v.YEAR
ORDER BY YEAR DESC;

SELECT publisher, YEAR, sum(global_sales) AS Yr_sale
FROM main.vgsales v 
GROUP BY publisher, year
ORDER BY Yr_sale  DESC, Year DESC;


SELECT Genre, global_sales, publisher,
  CASE 
    WHEN Year = 'N/A' THEN NULL
    ELSE CAST(Year AS INT)
  END AS Year_INT
FROM vgsales;

SELECT Genre, Global_sales,publisher, row_number() over()
FROM vgsales;

/* Leasson 5 Advance SQL
 
 */
SHOW ALL tables;

DESCRIBE vgsales;

SUMMARIZE vgsales;

