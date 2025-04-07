WITH cptit AS (

    SELECT *
    FROM {{ ref('stg_fn9__cptit') }}

),

tbfil AS (

    SELECT *
    FROM {{ ref('stg_fn9__tbfil') }}

),

tbfor AS (

    SELECT *
    FROM {{ ref('stg_fn9__tbfor') }}

),

tbhis AS (

    SELECT *
    FROM {{ ref('stg_fn9__tbhis') }}

),

intermediate AS (

    SELECT
        cpt.nrocontrole,
        cpt.anocontrole,
        fil.nome           AS nome_filial,
        forr.nomefantasia  AS nome_fornecedor,
        his.descricao      AS descricao_transacao,
        cpt.vlrtotal,
        cpt.vlrpago,
        cpt.vlrsaldo,
        cpt.dataemissao,
        cpt.datamovto,
        cpt.datavencto,
        cpt.datatlz
    FROM cptit cpt
    LEFT JOIN tbfil fil
        ON cpt.codfil = fil.codfil
    LEFT JOIN tbfor forr
        ON cpt.cgccpfforne = forr.cgccpfforne
    LEFT JOIN tbhis his
        ON cpt.codtransacao = his.codtransacao

)

SELECT *
FROM intermediate
