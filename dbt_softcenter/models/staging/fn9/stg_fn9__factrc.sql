WITH source AS (
    SELECT
        *
    FROM
        {{ source('fn9', 'FACTRC') }}
),

staging AS (
    SELECT
        nrofatura,
        anofatura,
        nrofatura || '-' || anofatura AS id,
        datavencto::DATE,
        datarecbto::DATE,
        COALESCE(dataalt::DATE, dataemissao::DATE) datatlz
    FROM
        source
)

SELECT
    *
FROM
    staging
