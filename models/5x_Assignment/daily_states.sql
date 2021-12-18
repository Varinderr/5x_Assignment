with daily_stats as(
   select date,
    total_cases,
    total_deaths,
    total_recovered
    from {{ref ('all_data')}} 
)
select date,
    sum(total_cases) as Total_Cases,
    sum(total_deaths) as Total_Deaths,
    sum(total_recovered) as Total_Recovered
from daily_stats
group by date