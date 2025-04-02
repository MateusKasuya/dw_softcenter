WITH source AS (
    SELECT *
    FROM {{ source('fn9', 'TBFOR') }}
),

staging AS (
    SELECT
        cgccpfforne,
        INITCAP(nomefantasia) as nomefantasia,
        datatlz::DATE
    FROM source
)

SELECT *
FROM staging
