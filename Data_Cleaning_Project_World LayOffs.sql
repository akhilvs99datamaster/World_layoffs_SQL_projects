-- DATA CLEANING PROJECT

SELECT *
FROM layoffs;

-- 1. REMOVE Duplicates
-- 2. Standardize the data
-- 3. NULL Values or blank values
-- 4. Remove any colomns

CREATE TABLE layoff_staging
LIKE layoffs;

INSERT layoff_staging
SELECT*
FROM layoffs;

SELECT *
FROM layoff_staging;

-- Remove duplicates

SELECT *,
ROW_NUMBER() OVER (
PARTITION BY company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions)AS row_num

FROM layoff_staging;

WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER (
PARTITION BY company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions)AS row_num

FROM layoff_staging
)
SELECT * FROM duplicate_cte
WHERE row_num >1;

SELECT * FROM layoff_staging;

-- Standardizing data

SELECT company , (TRIM(company))
FROM layoff_staging;

UPDATE layoff_staging
SET company = TRIM(company);

SELECT * 
FROM layoff_staging;

SELECT DISTINCT industry 
FROM layoff_staging
ORDER BY 1;


SELECT DISTINCT country 
FROM layoff_staging
ORDER BY 1;

SELECT DISTINCT country 
FROM layoff_staging;

UPDATE layoff_staging
SET  country = 'United States'
WHERE country = 'United States.'
;

SELECT *
FROM layoff_staging;

SELECT `date`,
STR_TO_DATE(`date`,'%m/%d/%Y')
FROM layoff_staging;

UPDATE layoff_staging
SET `date` = STR_TO_DATE(`date`,'%m/%d/%Y');

ALTER TABLE layoff_staging
MODIFY COLUMN `date` DATE;

-- NULL Values

SELECT *
FROM layoff_staging
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

SELECT *
FROM layoff_staging
WHERE industry IS NULL
OR industry = '';

SELECT company, industry
FROM layoff_staging
WHERE company = "Airbnb";


UPDATE layoff_staging
SET industry = NULL 
WHERE industry = '';

-- Remove unwanted columns


DELETE 
FROM layoff_staging
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL ;

SELECT *
FROM layoff_staging
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL ;

SELECT*
FROM layoff_staging;

--- END of Data cleaning 

