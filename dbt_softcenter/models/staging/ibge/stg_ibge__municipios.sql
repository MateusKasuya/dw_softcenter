with source as (
    select * from {{ source('ibge', 'ibge_municipios') }}
),
staging as (
    select * from source
)
select * from staging
