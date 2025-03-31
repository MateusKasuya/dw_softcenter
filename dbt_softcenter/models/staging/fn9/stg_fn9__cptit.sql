WITH source AS (
    SELECT
        *
    FROM
        {{ source('fn9', 'CPTIT') }}
),

staging AS (
    SELECT

        -- Primary Keys
        nrocontrole,
        anocontrole,

        -- Foreign Keys
        codfil,
        codtransacao,
        cgccpfforne,

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
