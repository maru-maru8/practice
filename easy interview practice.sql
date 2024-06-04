SELECT * FROM layoffs;


FINDING SUBSET;
SELECT 
country,
industry,
ROUND(AVG(laid_off),1) AS avg_laid_off
FROM layoffs
WHERE country= 'USA'
GROUP BY industry
ORDER BY avg(laid_off) DESC;

FINDING the company with the second highest layoffs in 2023;
SELECT
company,
laid_off
FROM layoffs
WHERE year = 2023
ORDER BY laid_off DESC
LIMIT 1,1;

finding the company with the second least layoffs in 2023;
SELECT
company,
laid_off
FROM layoffs
WHERE year = 2023
ORDER BY laid_off 
LIMIT 1,1;

WHICH INDUSTRY HAS LAID OFF THE MOST PEOPLE in 2023;
SELECT 
industry,
percentage AS pecent_laid_off
FROM layoffs
WHERE percentage = 100
AND year = 2023;

DISPLAY WHICH COMPANIES LAID OFF A EVEN NUMBER IN 2023;
SELECT
COMPANY,
laid_off
FROM layoffs
WHERE laid_off%2=1 AND year= 2023;

DISPLAY WHICH companies LAID OFF A ODD NUMBER IN 2023;
SELECT
COMPANY,
laid_off
FROM layoffs
WHERE laid_off%2=0 AND year= 2023;

display companies that start with 'a';
SELECT
company
FROM layoffs
WHERE company LIKE 'A%';

display companies that end in 'a';
SELECT 
company
FROM layoffs
WHERE company LIKE '%A';

display companies that have 'a' in their name;
SELECT
company
FROM layoffs
WHERE company LIKE '%a%';

display companies that dont contain 'a' at all;
SELECT 
company
FROM layoffs
WHERE company NOT LIKE '%a%';

display company that has 4 letters in its name;
SELECT 
company
FROM layoffs
WHERE company like '____';


USING LAG;
SELECT
company,
year,
laid_off,
LAG (laid_off) OVER(ORDER BY year) AS previous_layoff
FROM layoffs
WHERE company = 'cruise';

write a query to select all layoffs that occurred in the united states;
SELECT *
FROM layoffs
WHERE country = 'USA'
ORDER BY percentage DESC;

write a query to find how many companies fired over half of employees in 2023;
SELECT
COUNT(company) AS companies_over_50_percent
FROM layoffs
WHERE percentage > 50 AND year = 2023;

write a query to calculate the average percentage of layoffs for each industry;
SELECT
industry,
ROUND(AVG(percentage),1) AS avg_percent_layoff
FROM layoffs
GROUP BY industry;

Write a query to find the top 5 companies with the highest reduction in company size after layoffs;
SELECT
company,
(company_size_before_layoffs - company_size_after_layoffs) AS reduction_in_company
FROM layoffs
ORDER BY reduction_in_company DESC
LIMIT 5; 

write a query to find the top 3 countries with the highest total number of layoffs in the data industry considering only the years 2022 and 2023;
SELECT
country,
SUM(laid_off) AS total_laid_off
FROM layoffs
WHERE industry = 'data' AND year IN (2022, 2023)
GROUP BY country
ORDER BY total_laid_off DESC
LIMIT 3;




