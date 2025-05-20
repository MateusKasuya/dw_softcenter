
WITH factrc AS (

    SELECT *
    FROM {{ref('stg_mgp__factrc')}}

),

agg_integra AS (

    SELECT
        id_integra,
        SUM(vlrfatura) vlrfatura_integra,
        SUM(vlrrecbto) vlrrecbto_integra,
        SUM(vlrsaldo) vlrsaldo_integra
    FROM factrc
    GROUP BY id_integra

),

tbcta AS (
    SELECT *
    FROM {{ref('stg_mgp__tbcta')}}

),

intermediate AS (

    SELECT
        f1.id,
        ct.nomeconta,
        f1.datavencto,
        f1.datarecbto,
        f1.vlrfatura + COALESCE(f2.vlrfatura_integra,0) AS vlrfatura,
        f1.vlrrecbto + COALESCE(f2.vlrrecbto_integra,0) AS vlrrecbto,
        f1.vlrsaldo + COALESCE(f2.vlrsaldo_integra,0) AS vlrsaldo
    FROM factrc f1
    LEFT JOIN agg_integra f2
        ON f1.id = f2.id_integra
    LEFT JOIN tbcta ct
        ON f1.contareduz = ct.contareduz

)

SELECT *
FROM intermediate

