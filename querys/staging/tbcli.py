def create_tbcli_sql(schema: str):
    query = f"""
WITH source AS (
    SELECT *
    FROM {{{{source('{schema}', 'TBCLI')}}}}
),

staging AS (
    SELECT
        cgccpfcli,
        INITCAP(nomefantasia) AS nomefantasia
    FROM source
)

SELECT *
FROM staging

"""
    return query
