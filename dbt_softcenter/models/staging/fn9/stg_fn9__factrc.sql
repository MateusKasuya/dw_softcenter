
WITH source AS (
    SELECT
        *
    FROM
        {{source('fn9', 'FACTRC')}}
),

staging AS (
    SELECT
        nrofatura,
        anofatura,
        nrofatura || '-' || anofatura AS id,
        nrointegra || '-' || anointegra as id_integra,
        datavencto::DATE,
        datarecbto::DATE,
        vlrfatura,
        vlrrecbto,
        vlrsaldo,
        contareduz
    FROM
        source
)

SELECT
    *
FROM
    staging


