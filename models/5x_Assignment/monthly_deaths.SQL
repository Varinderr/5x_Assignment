with monthly_deaths as(
    select location,
    Date(date) as date, 
    New_Deaths
    from {{ref ('all_data')}} 
)
select location ,
        year(date_trunc('MONTH',date)) as Year,
        monthname(date_trunc('MONTH',date)) as Month,
        sum(New_Deaths) as Total_Deaths
        from monthly_deaths 
        group by date_trunc('YEAR',date), location, date_trunc('MONTH',date)