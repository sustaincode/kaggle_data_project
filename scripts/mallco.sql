SELECT *
FROM main.mall_customers mc;

SHOW tables;
DESCRIBE mall_customers;


SELECT Count(Gender)
FROM main.mall_customers mc
WHERE Gender == 'Female';
-- Male =88, Female = 112


SELECT min(age) AS MinAGE, Max(age) AS MaxAge
FROM main.mall_customers mc ;
-- Min Age 18, Max Age 70

SELECT 
  CASE 
    WHEN age BETWEEN 18 AND 20 THEN 'Group 1'
    WHEN age BETWEEN 21 AND 30 THEN 'Group 2'
    WHEN age BETWEEN 31 AND 40 THEN 'Group 3'
    WHEN age BETWEEN 41 AND 50 THEN 'Group 4'
    WHEN age BETWEEN 51 AND 60 THEN 'Group 5'
    WHEN age BETWEEN 61 AND 70 THEN 'Group 6'
  END AS age_group,
  COUNT(*) AS count
FROM 
  main.mall_customers mc 
GROUP BY 
  age_group
ORDER BY 
  age_group;
/*
 18 - 20 Group1 17
 21 - 30 Group2 45
 31 - 40 Group3 60
 41 - 50 Group4 38
 51 - 60 Group5 23
 61 - 70 Group6 17
 */

SELECT 
  CASE 
    WHEN age BETWEEN 18 AND 20 THEN 'Group 1'
    WHEN age BETWEEN 21 AND 30 THEN 'Group 2'
    WHEN age BETWEEN 31 AND 40 THEN 'Group 3'
    WHEN age BETWEEN 41 AND 50 THEN 'Group 4'
    WHEN age BETWEEN 51 AND 60 THEN 'Group 5'
    WHEN age BETWEEN 61 AND 70 THEN 'Group 6'
  END AS age_group,
  AVG("Annual Income (k$)") AS Avg_Income,
  AVG("Spending Score (1-100)") AS Spend_Score,
  COUNT(*) AS count
FROM 
  main.mall_customers mc 
GROUP BY 
  age_group
ORDER BY 
  age_group, Avg_Income, Spend_Score;

/*
Group 1	51.11764705882353	44.64705882352941	17
Group 2	56.75555555555555	67.22222222222223	45
Group 3	68.63333333333334	57.5	60
Group 4	63.60526315789474	34.39473684210526	38
Group 5	56.69565217391305	32.52173913043478	23
Group 6	50.0	44.1764705882353	17
*/

/*
 * Spending Power: Group2, Group3, Group1, Group 6, Group 4, Group 5
 * Avg_Income : Group3, Group4, Group2, Group5, Group1, Group6
*/

SELECT 
  CASE 
    WHEN age BETWEEN 18 AND 20 THEN 'Group 1'
    WHEN age BETWEEN 21 AND 30 THEN 'Group 2'
    WHEN age BETWEEN 31 AND 40 THEN 'Group 3'
    WHEN age BETWEEN 41 AND 50 THEN 'Group 4'
    WHEN age BETWEEN 51 AND 60 THEN 'Group 5'
    WHEN age BETWEEN 61 AND 70 THEN 'Group 6'
  END AS age_group,
  AVG("Annual Income (k$)") AS Avg_Income,
  AVG("Spending Score (1-100)") AS Spend_Score,
  COUNT(*) AS count
FROM 
  main.mall_customers mc 
WHERE Gender == 'Male'
GROUP BY 
  age_group
ORDER BY 
  age_group, Avg_Income, Spend_Score;

SELECT 
	Gender,   
	AVG("Annual Income (k$)") AS Avg_Income,
	AVG("Spending Score (1-100)") AS Spend_Score
FROM main.mall_customers mc 
GROUP BY 
 Gender 
 ORDER BY 
 Avg_Income, Spend_Score;
/*
Female	59.25	51.526785714285715
Male	62.22727272727273	48.51136363636363
 */

