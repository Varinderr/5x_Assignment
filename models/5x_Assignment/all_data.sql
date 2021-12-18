with all_data as(
    select * from {{ source("covid", "COVID_INDONESIA_INFO") }}
)
select * from all_data