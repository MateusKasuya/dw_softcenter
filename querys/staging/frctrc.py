def create_frctrc_sql(schema: str):
    query = f"""
WITH source AS (
    SELECT *
    FROM {{{{source('{schema}', 'FRCTRC')}}}}
),

staging AS (
    SELECT
        -- Identificação e data do CT-e
        nroctrc,
        ufctrc,
        dataemissao::DATE,

        -- Situação e tipo do CT-e
        CASE situacao
            WHEN 'N' THEN 'Normal'
            WHEN 'F' THEN 'Faturado'
        END AS situacao,

        CASE indctetpcte
            WHEN '0' THEN 'Normal'
            WHEN '1' THEN 'Complementar'
            WHEN '2' THEN 'Anulação'
            WHEN '3' THEN 'Substituição'
            ELSE indctetpcte
        END AS tipo_cte,

        -- Filial emitente
        codfilemite,

        -- Cliente
        cgccpfdestina,

        -- Destino
        codciddes,

        -- Produto
        codpro,

        -- Valores e peso do frete
        pesofrete / 1000.0 AS pesofrete_ton,
        vlrtotfrete,
        vlrpedagio,
        vlrimposto,

        -- Fatura
        nrofatura || '-' || anofatura AS id_fatura,

        -- Metadados
        datatlz::DATE

    FROM source
    WHERE situacao IN ('N', 'F')
)

SELECT *
FROM staging

"""
    return query
