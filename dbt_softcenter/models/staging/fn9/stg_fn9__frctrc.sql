with
source as (
    select * from {{ source('fn9', "FRCTRC")}}
),

renamed as (
    SELECT
        -- Identificação do CT-e
        nroctrc,
        dataemissao::date,

        -- Situação do CT-e
        CASE
            WHEN situacao = 'N' THEN 'Normal'
            WHEN situacao = 'F' THEN 'Faturado'
            WHEN situacao = 'C' THEN 'Cancelado'
            WHEN situacao = 'X' THEN 'Em Trânsito!'
            WHEN situacao = 'I' THEN 'Inutilizado'
            WHEN situacao = 'P' THEN 'Pendente'
            ELSE situacao
        END AS situacao,

        -- Origem e Destino
        codcidori,
        codciddes,

        -- Informações sobre o frete
        CASE
            WHEN indctetpcte = '0' THEN 'Normal'
            WHEN indctetpcte = '1' THEN 'Complementar'
            WHEN indctetpcte = '2' THEN 'Anulação'
            WHEN indctetpcte = '3' THEN 'Substituição'
            ELSE indctetpcte
        END AS tipo_cte,

        -- Valores e peso do frete
        pesofrete / 1000.0 AS pesofrete_ton,
        vlrfrete,
        vlrpedagio

    FROM source

)

select * from renamed
