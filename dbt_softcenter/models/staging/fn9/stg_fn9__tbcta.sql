
WITH source AS (
    SELECT *
    FROM {{source('fn9', 'TBCTA')}}
),

staging AS (
    SELECT
        contareduz,
        nomeconta

    FROM source
)

SELECT *
FROM staging


