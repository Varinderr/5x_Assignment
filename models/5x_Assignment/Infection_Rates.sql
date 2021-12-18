with infection_rates_info as (
    select location,
           population,
           sum(new_cases) as total_cases 
    from {{ref ('all_data')}} group by location, population                    
)

select location, total_cases,population,
       (total_cases/population)*100 as Infection_Rates
from infection_rates_info