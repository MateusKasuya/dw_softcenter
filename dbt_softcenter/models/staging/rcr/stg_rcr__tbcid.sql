
WITH source AS (
    SELECT *
    FROM {{source('rcr', 'TBCID')}}
),

staging AS (
    SELECT
        codcid,
        INITCAP(nome) AS nome,
        coduf,
        INITCAP(nome) || '-' || coduf AS cidade_uf,
        'Brasil,' || INITCAP(nome) || ',' || coduf AS localizacao_pbi,
        codibge::INT AS codibge

    FROM source
)

SELECT *
FROM staging


