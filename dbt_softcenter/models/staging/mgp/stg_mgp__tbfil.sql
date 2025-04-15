WITH source AS (
    SELECT
        *
    FROM
        {{ source('mgp', 'TBFIL') }}
),

staging AS (
    SELECT
        codfil,
        INITCAP(nome) AS nome
    FROM
        source
)

SELECT
    *
FROM
    staging
