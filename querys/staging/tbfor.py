def create_tbfor_sql(schema: str):
    query = f"""
WITH source AS (
    SELECT *
    FROM {{{{source('{schema}', 'TBFOR')}}}}
),

staging AS (
    SELECT
        cgccpfforne,
        INITCAP(nomefantasia) as nomefantasia
    FROM source
)

SELECT *
FROM staging


"""
    return query
