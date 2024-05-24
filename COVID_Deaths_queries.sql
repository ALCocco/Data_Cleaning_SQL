Select * From sqlproject..Covid_Deaths
	order by 3, 4

Select location, date, total_cases, new_cases, total_deaths, population
From sqlproject..Covid_Deaths
order by 1, 2

Select location, Count(*) as number_of_rows
From sqlproject..Covid_Deaths 
Where total_cases is not null
Group By location
Having COUNT(*) > 1
Order By location

Select location, date, total_cases, total_deaths, total_deaths * 100.0   / total_cases AS 'Death_Percentage'
From sqlproject..Covid_Deaths
order by 1, 2

Select location, date, total_cases, total_deaths, total_deaths * 100.0   / total_cases AS 'Death_Percentage'
From sqlproject..Covid_Deaths
Where date = '2024-01-07 00:00:00.0000000' 
and continent is not null
order by 1, 2

Select location, date, total_cases, total_deaths, total_deaths * 100.0   / total_cases AS 'Death_Percentage'
From sqlproject..Covid_Deaths
WHERE location = 'United States'
and continent is not null
order by 1, 2

Select location, max(total_deaths) as death_count
From sqlproject..Covid_Deaths
Where continent is not null
Group by location
order by death_count desc

--8. What was the total number of cases world-wide and what percentage of those cases were deaths?
Select sum(new_cases) as global_cases, sum(new_deaths) as global_deaths, sum(new_deaths) 
* 100.0 / sum(new_cases) as 'Death_Percentage'
From sqlproject..Covid_Deaths
Where continent is not null

Select location, Year(date) as year, sum(new_cases) as total_cases, sum(new_deaths) as total_deaths
From sqlproject..Covid_Deaths
Where continent is not null
Group by location, Year(date)
Order by location, Year(date)

Select continent, sum(case when continent in ('Asia','Africa')
Then new_cases Else 0 END) as total_cases_in_Africa_and_Asia
From sqlproject..Covid_Deaths
Group by continent
