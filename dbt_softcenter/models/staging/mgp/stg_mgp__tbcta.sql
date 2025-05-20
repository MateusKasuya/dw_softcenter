
WITH source AS (
    SELECT *
    FROM {{source('mgp', 'TBCTA')}}
),

staging AS (
    SELECT
        contareduz,
        nomeconta

    FROM source
)

SELECT *
FROM staging


