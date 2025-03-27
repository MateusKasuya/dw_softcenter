WITH source AS (
    SELECT *
    FROM {{ source('fn9', 'FRCTRC') }}
),

staging AS (
    SELECT
        -- Identificação e data do CT-e
        nroctrc,
        dataemissao::DATE,

        -- Situação e tipo do CT-e
        CASE situacao
            WHEN 'N' THEN 'Normal'
            WHEN 'F' THEN 'Faturado'
            WHEN 'C' THEN 'Cancelado'
            WHEN 'X' THEN 'Em Trânsito!'
            WHEN 'I' THEN 'Inutilizado'
            WHEN 'P' THEN 'Pendente'
            ELSE situacao
        END AS situacao,

        CASE indctetpcte
            WHEN '0' THEN 'Normal'
            WHEN '1' THEN 'Complementar'
            WHEN '2' THEN 'Anulação'
            WHEN '3' THEN 'Substituição'
            ELSE indctetpcte
        END AS tipo_cte,

        -- Origem e destino
        codcidori,
        codciddes,

        -- Cliente e filial emitente
        cgccpfdestina,
        codfilemite,

        -- Valores e peso do frete
        pesofrete / 1000.0 AS pesofrete_ton,
        vlrfrete,
        vlrpedagio,
        vlrimposto

    FROM source
)

SELECT *
FROM staging
