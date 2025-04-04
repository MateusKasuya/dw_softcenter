WITH factrc AS (

    SELECT *
    FROM {{ ref('stg_fn9__factrc') }}

),

agg_integra AS (

    SELECT
        id_integra,
        SUM(vlrrecbto) vlrrecbto_integra,
        SUM(vlrsaldo) vlrsaldo_integra
    FROM factrc
    GROUP BY id_integra

),

intermediate AS (

    SELECT
        f1.nrofatura,
        f1.anofatura,
        f1.id,
        f1.datavencto,
        f1.datarecbto,
        f1.vlrrecbto + f2.vlrrecbto_integra AS vlrrecbto,
        f1.vlrsaldo + f2.vlrsaldo_integra AS vlrsaldo
    FROM factrc f1
    LEFT JOIN agg_integra f2
        ON f1.id = f2.id_integra

)

SELECT *
FROM intermediate
