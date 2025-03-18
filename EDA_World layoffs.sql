-- Exploaratory data analysis (EDA) On World Layoffs

SELECT count(*) 
FROM layoff_staging;

SELECT * 
FROM layoff_staging;

-- Objective

-- 1.what is the start and end data of the layoff data 
-- 2.what is the Layoff data of India in each year 
-- 3. give 3 company , which layed off most every year.
-- 4.rolling table of Indian company laying off

-- 1.what is the start and end data of the layoff data 

SELECT MAX(`date`) AS 'end date', MIN(`date`) AS 'start date'
FROM layoff_staging;

-- Total Lay OFF from each company

SELECT company,SUM(total_laid_off) AS 'Total LayOff'
FROM layoff_staging
WHERE country = 'India'
GROUP BY company
ORDER BY 2 DESC;

-- World Layoff in each year 

SELECT YEAR(`date`) AS 'Calender Year',SUM(total_laid_off) AS 'Total LayOff'
FROM layoff_staging
GROUP BY YEAR(`date`);

-- India Layoff in each year 

SELECT YEAR(`date`) AS 'Calender Year',SUM(total_laid_off) AS 'Total LayOff'
FROM layoff_staging
WHERE country = 'India'
GROUP BY YEAR(`date`);

-- Indian layoff data in each year 

SELECT company,YEAR(`date`) AS 'Calender Year',SUM(total_laid_off) AS 'Total LayOff'
FROM layoff_staging
WHERE country = 'India'
GROUP BY company, YEAR(`date`)
ORDER BY 3 DESC;

-- TOP 3 Indian companies with most layoffs in each year

(SELECT company,YEAR(`date`) AS 'Calender Year',SUM(total_laid_off) AS 'Total LayOff'
FROM layoff_staging
WHERE country = 'India' AND YEAR(`date`)='2023%'
GROUP BY company, YEAR(`date`)
ORDER BY 3 DESC
LIMIT 3)
UNION
(SELECT company,YEAR(`date`) AS 'Calender Year',SUM(total_laid_off) AS 'Total LayOff'
FROM layoff_staging
WHERE country = 'India' AND YEAR(`date`)='2022%'
GROUP BY company, YEAR(`date`)
ORDER BY 3 DESC
LIMIT 3);

-- compamies with most layoffs in 2022

SELECT company,YEAR(`date`) AS 'Calender Year',SUM(total_laid_off) AS 'Total LayOff'
FROM layoff_staging
WHERE country = 'India' AND YEAR(`date`) = '2022'
GROUP BY company,YEAR(`date`);

-- TOP 3 Overall world companies with most layoffs

(SELECT company,YEAR(`date`) AS 'Calender Year',SUM(total_laid_off) AS 'Total LayOff'
FROM layoff_staging
WHERE YEAR(`date`)='2023%'
GROUP BY company, YEAR(`date`)
ORDER BY 3 DESC
LIMIT 3)
UNION
(SELECT company,YEAR(`date`) AS 'Calender Year',SUM(total_laid_off) AS 'Total LayOff'
FROM layoff_staging
WHERE YEAR(`date`)='2022%'
GROUP BY company, YEAR(`date`)
ORDER BY 3 DESC
LIMIT 3);


-- 4.rolling table of Indian company laying off

WITH rolling_cte AS 
(
SELECT SUBSTRING(`date`,1,7) AS Calender_Month,SUM(total_laid_off) AS Total_LayOff
FROM layoff_staging
GROUP BY Calender_Month
)
SELECT Calender_Month,Total_LayOff, SUM(Total_LayOff) OVER(ORDER BY Calender_Month) AS 'Rolling Total'
FROM rolling_cte;

SELECT SUBSTRING(`date`,1,7) AS Calender_Month,SUM(total_laid_off) AS Total_LayOff
FROM layoff_staging
GROUP BY Calender_Month ;

SELECT SUM(total_laid_off)
FROM layoff_staging;

-- Rolling total by Indian Company

WITH rolling_cte AS 
(
SELECT SUM(total_laid_off) AS Total_LayOff,company
FROM layoff_staging
WHERE country = 'India'
GROUP BY company 
)
SELECT company,Total_LayOff, SUM(Total_LayOff) OVER(ORDER BY Total_LayOff DESC) AS 'Rolling Total'
FROM rolling_cte; 

-- Rolling total by World Company

WITH rolling_cte AS 
(
SELECT SUM(total_laid_off) AS Total_LayOff,company
FROM layoff_staging
GROUP BY company 
)
SELECT company,Total_LayOff, SUM(Total_LayOff) OVER(ORDER BY Total_LayOff DESC) AS 'Rolling Total'
FROM rolling_cte; 

-- Ranking the company as per there layoff totals 

WITH Company_Ranking(company,years,Total_Layoff )AS 
(
SELECT company,YEAR(`date`), SUM(total_laid_off)
FROM layoff_staging
WHERE country = 'India'
GROUP BY company , YEAR(`date`)
)
SELECT *,DENSE_RANK() OVER(PARTITION BY years ORDER BY Total_Layoff DESC)
FROM Company_Ranking; 













