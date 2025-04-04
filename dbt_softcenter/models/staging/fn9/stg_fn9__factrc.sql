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
        nrointegra || '-' || anointegra as id_integra,
        datavencto::DATE,
        datarecbto::DATE,
        vlrrecbto,
        vlrsaldo,
        COALESCE(dataalt::DATE, dataemissao::DATE) datatlz
    FROM
        source
)

SELECT
    *
FROM
    staging
