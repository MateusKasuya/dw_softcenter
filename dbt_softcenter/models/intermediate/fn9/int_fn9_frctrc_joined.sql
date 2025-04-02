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
    FROM {{ ref('stg_fn9__factrc') }}

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
        fr.vlrfrete,
        fr.vlrpedagio,
        fr.vlrimposto,
        fa.datavencto,
        fa.datarecbto
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
