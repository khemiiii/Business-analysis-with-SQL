--select * from International_Breweries$

--Profit worth of the Breweries 
select sum(profit) as ProfitWorth
from International_Breweries$

--Comparing total profit between the anglophone and francophone territories
select distinct(countries)
from International_Breweries$

select sum(profit) as TotalProfitF
from International_Breweries$
where COUNTRIES in ('Senegal' , 'Togo', 'Benin') 

select sum(profit) as TotalProfitA
from International_Breweries$
where COUNTRIES in ('Nigeria' , 'Ghana') 

--Identifying the country with the highest profit in 2019
select top (1) COUNTRIES, sum(profit) as TotalProfit 
from International_Breweries$
where YEARS = '2019'
group by COUNTRIES 
order by 2 desc

--Year with the highest Profit throughout the 3 Years
select top (1) YEARS, sum(profit) as TotalProfit
from International_Breweries$
group by YEARS
order by 2 desc

--Month with the least Profit across the 3 Years
select top (1) MONTHS, sum(profit) as TotalProfit
from International_Breweries$
group by MONTHS
order by 2 asc

--Calculating the minimum profit earned in the month of December 2018
select MONTHS, Min(profit) as MinProfit
from International_Breweries$
where YEARS = '2018' and MONTHS = 'December'
group by MONTHS

--Comparing the percentage of profit for each of the month in 2019
select MONTHS, PROFIT into TotalProfit
from International_Breweries$
where YEARS = '2019' 

select MONTHS, round((SUM(PROFIT) / (SELECT SUM(PROFIT) FROM TotalProfit))*100 , 2) as Percentage  
from International_Breweries$
where YEARS = 2019
GROUP BY MONTHS
order by 2 desc

--Brand with the highest profit in Senegal
select top (1) BRANDS, sum(profit) as MaxProfit
from International_Breweries$
where COUNTRIES = 'Senegal'
group by BRANDS
order by 2 desc

--Identifying the Country with the highest consumption of beer
select top (1) COUNTRIES, sum(quantity) as TotalQuantity
from International_Breweries$
group by countries
order by 2 desc

--The personnel who had the highest sales of Budweiser in Senegal
select top (1) SALES_REP, sum(PROFIT) as TotalProfit
from International_Breweries$
where COUNTRIES = 'senegal' and BRANDS = 'budweiser'
group by SALES_REP
order by 2 desc

--Country with the highest profit in the fourth quarter of 2019
select top (1) COUNTRIES, sum(profit) as TotalProfit
from International_Breweries$
where YEARS = 2019 and MONTHS in ('october', 'november', 'december')
group by COUNTRIES
order by 2 desc

--B1.
--select TOP (3) BRANDS, sum(QUANTITY) as TotalQuantity
--from International_Breweries$
--where years in ('2018', '2019')
--and COUNTRIES in ('Senegal' , 'Togo', 'Benin') 
--group by BRANDS
--order by 2 desc

--B2.
--select top (2) BRANDS, sum(QUANTITY) as TotalQuantity
--from International_Breweries$
--where COUNTRIES = 'Ghana'
--group by BRANDS
--order by 2 desc

--B3.
--select BRANDS, UNIT_PRICE, sum(quantity) as quantity, sum(cost) as cost, sum(profit) as profit, REGION, MONTHS, YEARS
--from International_Breweries$
--where COUNTRIES = 'Nigeria'
--and brands not like '%malt'
--group by brands, UNIT_PRICE, region, YEARS, MONTHS


--B4.
--select TOP (1) BRANDS, sum(QUANTITY) as TotalQuantity
--from International_Breweries$
--where years in ('2018', '2019')
--and COUNTRIES in ('Nigeria', 'Ghana') 
--and BRANDS like '%malt'
--group by BRANDS
--order by 2 desc

--B5.
--select BRANDS, sum(QUANTITY) as TotalQuantity
--from International_Breweries$
--where years = '2019'
--and COUNTRIES in ('Nigeria') 
--group by BRANDS
--order by 2 desc

--B6.
--select top (1) BRANDS, sum(QUANTITY) as TotalQuantity
--from International_Breweries$
--where REGION = 'southsouth'
--and COUNTRIES in ('Nigeria') 
--group by BRANDS
--order by 2 desc

----B7.
--select BRANDS, sum(QUANTITY) as TotalQuantity
--from International_Breweries$
--where COUNTRIES = 'Nigeria'
--and brands not like '%malt'
--group by brands

----B8.
--select BRANDS, region, sum(QUANTITY) as TotalQuantity
--from International_Breweries$
--where COUNTRIES = 'Nigeria'
--and brands like 'budweiser'
--group by region, brands
--order by 3 desc

----B9.
--select BRANDS, region, sum(QUANTITY) as TotalQuantity
--from International_Breweries$
--where COUNTRIES = 'Nigeria'
--and YEARS = 2019
--and brands like 'budweiser'
--group by region, brands
----order by 3 desc
