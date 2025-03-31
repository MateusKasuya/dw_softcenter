WITH source AS (
    SELECT *
    FROM {{ source('fn9', 'TBCID') }}
),

staging AS (
    SELECT
        codcid,
        nome,
        coduf,
        nome || '-' || coduf AS cidade_uf,
        'Brasil,' || nome || ',' || coduf AS localizacao_pbi,
        codibge::INT AS codibge,
        datatlz::DATE

    FROM source
)

SELECT *
FROM staging
