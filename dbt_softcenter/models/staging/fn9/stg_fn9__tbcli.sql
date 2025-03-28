WITH source AS (
    SELECT *
    FROM {{ source('fn9', 'TBCLI') }}
),

staging AS (
    SELECT
        cgccpfcli,
        nomefantasia,
        datatlz::DATE
    FROM source
)

SELECT *
FROM staging
