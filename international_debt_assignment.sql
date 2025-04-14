select * from international_debt_with_missing_values;

-- 1. What is the total amount of debt owed by all countries in the dataset?
/*select 
	(sum(debt)/1000000)::numeric(12,2) as Total_debt_in_millions
from international_debt_with_missing_values;*/
select
	sum(debt)
from international_debt_with_missing_values;


-- 2. How many distinct countries are recorded in the dataset?
select
	count(distinct country_name) as Unique_countries
from international_debt_with_missing_values;


-- 3. What are the distinct types of debt indicators, and what do they represent?
select
	distinct indicator_name as Unique_indicator
from international_debt_with_missing_values;


--Which country has the highest total debt, and how much does it owe?
select
	country_name, sum(debt)	total_debt
from international_debt_with_missing_values
group by country_name
order by total_debt desc
limit 2;


--What is the average debt across different debt indicators?
select
	distinct indicator_name as Unique_indicator, avg(debt)
from international_debt_with_missing_values
group by indicator_name;


--Which country has made the highest amount of principal repayments?
select
	distinct country_name, sum(debt)
from international_debt_with_missing_values
where indicator_name like '%Principal repayment%'
group by country_name
having sum(debt) >=0
order by sum(debt) desc;

select
	distinct country_name, indicator_name, sum(debt)
from international_debt_with_missing_values
where indicator_name like '%Principal repayment%'
group by country_name, indicator_name
having sum(debt) >=0
order by sum(debt) desc;



--What is the most common debt indicator across all countries?
select count(indicator_code)
	from international_debt_with_missing_values;

select indicator_name, count(indicator_name)
	from international_debt_with_missing_values
group by indicator_name
order by count(indicator_name) desc;


--Identify any other key debt trends and summarize your findings.

