
WITH source AS (
    SELECT
        *
    FROM
        {{source('rcr', 'TBFIL')}}
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
