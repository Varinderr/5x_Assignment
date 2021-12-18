with location_wise_info as(
    select location,
    total_cases,
    total_Deaths,
    total_recovered
    from {{ref ('all_data')}}
)
select location,
    sum(total_cases) as Cases,
    sum(total_Deaths) as Deaths ,
    sum(total_recovered) as Recovered
    from location_wise_info
    group by location 
    order by location asc
    