
WITH source AS (
    SELECT *
    FROM {{source('rcr', 'TBFOR')}}
),

staging AS (
    SELECT
        cgccpfforne,
        INITCAP(nomefantasia) as nomefantasia
    FROM source
)

SELECT *
FROM staging


