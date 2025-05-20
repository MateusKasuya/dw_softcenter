def create_tbfil_sql(schema: str):
    query = f"""
WITH source AS (
    SELECT
        *
    FROM
        {{{{source('{schema}', 'TBFIL')}}}}
),

staging AS (
    SELECT
        codfil,
        INITCAP(nome) AS nome
    FROM
        source
)

SELECT
    *
FROM
    staging

"""
    return query
