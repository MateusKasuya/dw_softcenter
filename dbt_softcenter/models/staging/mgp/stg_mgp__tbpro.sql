WITH source AS (
    SELECT *
    FROM {{ source('mgp', 'TBPRO') }}
),

staging AS (
    SELECT
        codpro,
        INITCAP(nome) as nome
    FROM source
)

SELECT *
FROM staging
