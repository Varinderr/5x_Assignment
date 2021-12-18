with monthly_cases as(
    select location,
    Date(date) as date, 
    new_cases
    from {{ref ('all_data')}} 
)
select location ,
        year(date_trunc('MONTH',date)) as Year,
        monthname(date_trunc('MONTH',date)) as Month,
        sum(new_cases) as Total_cases
        from monthly_cases     
        group by date_trunc('YEAR',date), location, date_trunc('MONTH',date)