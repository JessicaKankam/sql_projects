# SQL Data Cleaning Project – Global Layoffs Dataset

## Business Context
Real-world datasets often contain missing values, duplicates, and inconsistent formatting that make them unsuitable for reliable analysis. This project focuses on cleaning and standardizing a global layoffs dataset using SQL to prepare it for accurate reporting and downstream analytics.

## Objective
- Identify and resolve data quality issues
- Standardize categorical and date fields
- Remove duplicate records
- Produce an analytics-ready dataset using SQL only

## Dataset
The dataset contains records of company layoffs across industries and countries, including:
- Company name
- Industry
- Location and country
- Total layoffs and percentage laid off
- Layoff dates and funding stage

## Data Quality Issues Identified
- Missing and blank industry values
- Inconsistent text formatting across categorical fields
- Duplicate records
- Date fields stored in inconsistent formats

## Cleaning Approach
The cleaning process was implemented entirely in SQL and followed a structured workflow:
1. Initial data inspection and profiling
2. Create staging tables
3.  Remove Duplicates
4.  Standadize the data (text and date fields)
5.  Null values and blank values
6.  Remove any unnecessary columns. 
7. Post-cleaning validation checks

## Files
- `data/layoffs.csv` – Raw dataset
- `sql/layoffs_data_cleaning.sql` – SQL script containing inspection, cleaning, and validation logic
- `cleaned data/layoffs.csv` - Cleaned dataset

## Skills Demonstrated
- SQL data cleaning and transformation
- Use of CTEs, JOINS, WHERE CLAUSE, CASE statements, and window functions
- Data validation and quality checks
- Writing structured, readable SQL scripts

## Disclaimer
This is a personal portfolio project created for demonstration purposes.

