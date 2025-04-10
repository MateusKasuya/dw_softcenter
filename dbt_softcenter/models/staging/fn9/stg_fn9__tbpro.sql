WITH source AS (
    SELECT *
    FROM {{ source('fn9', 'TBPRO') }}
),

staging AS (
    SELECT
        codpro,
        INITCAP(nome) as nome
    FROM source
)

SELECT *
FROM staging
