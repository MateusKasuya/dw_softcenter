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

        -- Meta Dados
        COALESCE(datadig::DATE, dataemissao::DATE) datatlz

    FROM
        source
)

SELECT
    *
FROM
    staging
