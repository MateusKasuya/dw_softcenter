
WITH source AS (
    SELECT *
    FROM {{source('rcr', 'TBCLI')}}
),

staging AS (
    SELECT
        cgccpfcli,
        INITCAP(nomefantasia) AS nomefantasia
    FROM source
)

SELECT *
FROM staging

