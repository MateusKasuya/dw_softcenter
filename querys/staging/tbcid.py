def create_tbcid_sql(schema: str):
    query = f"""
WITH source AS (
    SELECT *
    FROM {{{{source('{schema}', 'TBCID')}}}}
),

staging AS (
    SELECT
        codcid,
        INITCAP(nome) AS nome,
        coduf,
        INITCAP(nome) || '-' || coduf AS cidade_uf,
        'Brasil,' || INITCAP(nome) || ',' || coduf AS localizacao_pbi,
        codibge::INT AS codibge

    FROM source
)

SELECT *
FROM staging


"""
    return query
