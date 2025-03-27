with source as (
    select * from {{ source('fn9', "TBCLI")}}
),
staging as (
    select * from source
)
select * from staging
