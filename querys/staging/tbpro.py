def create_tbpro_sql(schema: str):
    query = f"""
WITH source AS (
    SELECT *
    FROM {{{{source('{schema}', 'TBPRO')}}}}
),

staging AS (
    SELECT
        codpro,
        INITCAP(nome) as nome
    FROM source
)

SELECT *
FROM staging


"""
    return query
