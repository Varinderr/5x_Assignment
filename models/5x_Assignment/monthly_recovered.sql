with monthly_deaths as(
    select location,
    Date(date) as date, 
    New_recovered
    from {{ref ('all_data')}} 
)
select location ,
        year(date_trunc('MONTH',date)) as Year,
        monthname(date_trunc('MONTH',date)) as Month,
        sum(New_recovered) as Total_Recovered
        from monthly_deaths 
        group by date_trunc('YEAR',date), location, date_trunc('MONTH',date)