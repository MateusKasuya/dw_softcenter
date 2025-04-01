WITH source AS (
    SELECT
        *
    FROM
        {{ source('raw', 'ibge_municipios') }}
),

staging AS (
    SELECT
        id,
        "microrregiao_mesorregiao.nome" AS mesorregiao,
        "microrregiao_mesorregiao.UF.regiao.nome" AS regiao
    FROM
        source
)

SELECT
    *
FROM
    staging
