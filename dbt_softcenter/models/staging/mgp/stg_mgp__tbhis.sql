WITH source AS (
    SELECT *
    FROM {{ source('mgp', 'TBHIS') }}
),

staging AS (
    SELECT
        codtransacao,
        INITCAP(descricao) as descricao
    FROM source
)

SELECT *
FROM staging
