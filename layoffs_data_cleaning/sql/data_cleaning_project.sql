SELECT *
FROM layoffs;

-- STEPS IN DATA CLEANING
-- 1. Remove Duplicates 
-- 2. Standadize the data (issues with spelling..etc)
-- 3. Null values and blank values
-- 4. Remove any unnecessary columns. May be more appropriate to create a staging data to manipulate instead of deletion of raw data

-- Creating a staging dataset
CREATE TABLE layoffs_staging
LIKE layoffs;

INSERT INTO layoffs_staging
SELECT *
FROM layoffs;

SELECT *
FROM layoffs_staging;


-- 1. REMOVING DUPLICATES
WITH duplicate_cte AS 
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, 
industry, total_laid_off, percentage_laid_off,`date`, stage,
country, funds_raised_millions) AS row_num
FROM layoffs_staging
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;
-- because those that have a row_num of 2+ are our duplicates

-- to test: finding duplicates
SELECT *
FROM layoffs_staging
WHERE company = 'Casper';

-- now we need to delete the duplicates. ie: the rows with a row num of 2

CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- empty table
SELECT *
FROM layoffs_staging2;

-- populate the table
INSERT INTO layoffs_staging2
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, 
industry, total_laid_off, percentage_laid_off,`date`, stage,
country, funds_raised_millions) AS row_num
FROM layoffs_staging;

SELECT *
FROM layoffs_staging2
WHERE row_num > 1;

DELETE
FROM layoffs_staging2
WHERE row_num > 1;

-- now the duplicates have been deleted
SELECT *
FROM layoffs_staging2;


-- 2. STANDARDIZING THE DATA
SELECT company, TRIM(company)
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET company = TRIM(company);


SELECT DISTINCT industry
FROM layoffs_staging2
ORDER BY 1;

SELECT *
FROM layoffs_staging2
WHERE industry LIKE 'Crypto%';

UPDATE layoffs_staging2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

SELECT DISTINCT location
FROM layoffs_staging2
ORDER BY 1;

SELECT DISTINCT country
FROM layoffs_staging2
ORDER BY 1;

SELECT DISTINCT country
FROM layoffs_staging2
WHERE country LIKE 'United States%';

SELECT DISTINCT country, TRIM(Trailing '.' FROM country)
FROM layoffs_staging2
ORDER BY 1;

UPDATE layoffs_staging2
SET country = TRIM(Trailing '.' FROM country)
WHERE country LIKE 'United States%';


SELECT *
FROM layoffs_staging2;


SELECT `date`,
STR_TO_DATE(`date`, '%m/%d/%Y')
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE;

SELECT *
FROM layoffs_staging2;


-- 3. NULL VALUES AND BLANKS
SELECT *
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND  percentage_laid_off IS NULL;

-- converting blank rows in industry to nulls
UPDATE layoffs_staging2
SET industry = NULL
WHERE industry = '';


SELECT *
FROM layoffs_staging2
WHERE industry IS NULL
OR industry = '';

SELECT *
FROM layoffs_staging2
WHERE company = 'Airbnb';

SELECT t1.industry, t2.industry
FROM layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;

UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry IS NULL 
AND t2.industry IS NOT NULL;

SELECT *
FROM layoffs_staging2
WHERE company LIKE 'Bally%';


DELETE
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND  percentage_laid_off IS NULL;

SELECT *
FROM layoffs_staging2;


-- REMOVE ANY UNNECESSARY COLUMNS OR ROWS:
ALTER TABLE layoffs_staging2
DROP COLUMN row_num;
