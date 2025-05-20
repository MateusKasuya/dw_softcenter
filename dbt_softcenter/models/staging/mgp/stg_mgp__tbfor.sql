
WITH source AS (
    SELECT *
    FROM {{source('mgp', 'TBFOR')}}
),

staging AS (
    SELECT
        cgccpfforne,
        INITCAP(nomefantasia) as nomefantasia
    FROM source
)

SELECT *
FROM staging


