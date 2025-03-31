WITH source AS (
    SELECT
        *
    FROM
        {{ source('raw', 'ibge_municipios') }}
),

staging AS (
    SELECT
        id,
        nome AS municipio,
        "microrregiao_mesorregiao.nome" AS mesorregiao,
        "microrregiao_mesorregiao.UF.sigla" AS uf,
        "microrregiao_mesorregiao.UF.regiao.nome" AS regiao
    FROM
        source
)

SELECT
    *
FROM
    staging
