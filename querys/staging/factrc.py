def create_factrc_sql(schema: str):
    query = f"""
WITH source AS (
    SELECT
        *
    FROM
        {{{{source('{schema}', 'FACTRC')}}}}
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
        vlrsaldo
    FROM
        source
)

SELECT
    *
FROM
    staging


"""
    return query
