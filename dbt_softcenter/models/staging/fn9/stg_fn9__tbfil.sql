WITH source AS (
    SELECT
        *
    FROM
        {{ source('fn9', 'TBFIL') }}
),

staging AS (
    SELECT
        codfil,
        nome,
        datatlz::DATE
    FROM
        source
)

SELECT
    *
FROM
    staging
