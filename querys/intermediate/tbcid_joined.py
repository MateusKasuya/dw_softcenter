def create_tbcid_joined_sql(schema: str):
    query = f"""
WITH tbcid AS (

    SELECT *
    FROM {{{{ref('stg_{schema}__tbcid')}}}}

),

ibge AS (

    SELECT *
    FROM {{{{ref('stg_ibge__municipios')}}}}

),

intermediate AS (

    SELECT
        tbcid.codcid,
        tbcid.nome,
        ibge.mesorregiao,
        tbcid.coduf,
        ibge.regiao,
        tbcid.cidade_uf,
        tbcid.localizacao_pbi
    FROM tbcid
    LEFT JOIN ibge
        ON tbcid.codibge = ibge.id

)

SELECT *
FROM intermediate

"""
    return query
