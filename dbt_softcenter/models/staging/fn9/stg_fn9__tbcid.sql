with
source as (
    select * from {{ source('fn9', "TBCID")}}
),

renamed as (
    select
        codcid,
        nome,
        coduf,
        'BR,' || nome || ',' || coduf as localizacao,
        codibge,
        endlatitude,
        endlongitude
    from source

)

select * from renamed
