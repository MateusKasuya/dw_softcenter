with source as (
    select * from {{ source('fn9', "TBFIL")}}
),
staging as (
    select * from source
)
select * from staging
