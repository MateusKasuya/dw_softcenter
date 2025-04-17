WITH source AS (
    SELECT
        *
    FROM
        {{ source('mgp', 'CPTIT') }}
),

staging AS (
    SELECT

        -- Primary Keys
        nrocontrole,
        anocontrole,

        -- Foreign Keys
        codfil,
        cgccpfforne,
        codtransacao,

        -- Valores
        vlrtotal,
        vlrtotal - vlrsaldo AS vlrpago,
        vlrsaldo,

        -- Datas
        dataemissao::DATE,
        datamovto::DATE,
        datavencto::DATE,

        -- Condicao Fatura
        CASE
            WHEN vlrsaldo = 0 THEN 'Pago'
            WHEN vlrsaldo > 0 AND CURRENT_DATE <= datavencto::DATE THEN 'A Pagar'
            ELSE 'Em Atraso'
        END AS condicao_fatura,

        -- Meta Dados
        COALESCE(datadig::DATE, dataemissao::DATE) datatlz

    FROM
        source
)

SELECT
    *
FROM
    staging
