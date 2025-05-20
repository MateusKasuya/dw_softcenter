
WITH source AS (
    SELECT *
    FROM {{source('rcr', 'TBHIS')}}
),

staging AS (
    SELECT
        codtransacao,
        INITCAP(descricao) as descricao
    FROM source
)

SELECT *
FROM staging
