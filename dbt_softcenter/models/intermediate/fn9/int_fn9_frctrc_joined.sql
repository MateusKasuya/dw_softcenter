WITH frctrc AS (

    SELECT *
    FROM {{ ref('stg_fn9__frctrc') }}

),

tbfil AS (

    SELECT *
    FROM {{ ref('stg_fn9__tbfil') }}

),

tbcli AS (

    SELECT *
    FROM {{ ref('stg_fn9__tbcli') }}

),

tbcid AS (

    SELECT *
    FROM {{ ref('int_fn9_tbcid_joined') }}

),

factrc AS (

    SELECT *
    FROM {{ ref('int_fn9_factrc_joined') }}

),

intermediate AS (

    SELECT
        fr.nroctrc,
        fr.dataemissao,
        fr.situacao,
        fr.tipo_cte,
        fil.nome             AS filial,
        cli.nomefantasia     AS cliente,
        cid.nome             AS cidade,
        cid.mesorregiao,
        cid.coduf,
        cid.regiao,
        cid.cidade_uf,
        cid.localizacao_pbi,
        fr.pesofrete_ton,
        fr.vlrtotfrete,
        fr.vlrpedagio,
        fr.vlrimposto,
        fa.datavencto,
        fa.datarecbto,
        fa.datarecbto - fr.dataemissao AS dias_recebimento,
        fa.vlrrecbto,
        fa.vlrsaldo,
        CASE
            WHEN fa.datavencto IS NULL AND fa.vlrrecbto IS NULL AND fa.vlrsaldo IS NULL THEN 'Ag. Fatura'
            WHEN fa.datavencto < CURRENT_DATE AND fa.vlrrecbto = 0 AND fa.vlrsaldo > 0 THEN 'Em Atraso'
            WHEN fa.datavencto IS NOT NULL AND fa.vlrrecbto > 0 AND fa.vlrsaldo = 0 THEN 'Recebida'
            WHEN fa.datavencto IS NOT NULL AND fa.vlrrecbto > 0 AND fa.vlrsaldo > 0 THEN 'Recebida Parcialmente'
            ELSE 'A Receber'
        END AS condicao_fatura
    FROM frctrc fr
    LEFT JOIN tbfil fil
        ON fr.codfilemite = fil.codfil
    LEFT JOIN tbcli cli
        ON fr.cgccpfdestina = cli.cgccpfcli
    LEFT JOIN tbcid cid
        ON fr.codciddes = cid.codcid
    LEFT JOIN factrc fa
        ON fr.id_fatura = fa.id

)

SELECT *
FROM intermediate
