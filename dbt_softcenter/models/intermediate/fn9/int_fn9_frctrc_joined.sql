with frctrc as (

    select * from {{ ref('stg_fn9__frctrc') }}

),

tbfil as (

    select * from {{ ref('stg_fn9__tbfil') }}

),

tbcli as (

    select * from {{ ref('stg_fn9__tbcli') }}

),

tbcid as (

    select * from {{ ref('int_fn9_tbcid_joined') }}

),

factrc as (

    select * from {{ ref('stg_fn9__factrc')}}

),

intermediate as (

    select
        fr.nroctrc,
        fr.dataemissao,
        fr.situacao,
        fr.tipo_cte,
        fil.nome as filial,
        cli.nomefantasia as cliente,
        cid.nome as cidade,
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
    from frctrc fr
    left join tbfil fil on fr.codfilemite = fil.codfil
    left join tbcli cli on fr.cgccpfdestina = cli.cgccpfcli
    left join tbcid cid on fr.codciddes = cid.codcid
    left join factrc fa on fr.id_fatura = fa.id


)

select * from intermediate
