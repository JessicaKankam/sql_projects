# Global Layoffs EDA (SQL)

## Overview
Exploratory data analysis (EDA) using SQL on a **cleaned global layoffs dataset** to identify trends across **companies, industries, countries, and time**.

- Table used: `layoffs_staging2`
- Focus: scale, timing, and concentration of layoffs

---

## What This Analysis Covers
- Overall layoff magnitude and severity
- Companies with 100% workforce layoffs
- Total layoffs by company, industry, country, and stage
- Yearly and monthly layoff trends
- Rolling (cumulative) layoffs over time
- Top 5 companies with the most layoffs per year

---

## SQL Skills Used
- Aggregations (`SUM`, `MAX`, `MIN`)
- Grouping & filtering
- Date functions (`YEAR`, `SUBSTRING`)
- CTEs
- Window functions (`DENSE_RANK`, rolling sums)

---

## Files
- **1. [SQL File_EDA.sql](EDA_in_SQL/EDA.sql)**
- **2. [Cleaned data_layoffs](layoffs_data_cleaning/datasets/cleaned_data_layoffs.csv)**

---

## How to Run
Load the cleaned dataset into a table named `layoffs_staging2` and run `EDA.sql` in MySQL.

