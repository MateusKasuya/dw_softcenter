with cptit as (

    select * from {{ ref('stg_fn9__cptit') }}

),

tbfil as (

    select * from {{ ref('stg_fn9__tbfil')}}

),

tbfor as (

    select * from {{ ref('stg_fn9__tbfor') }}

),

tbhis as (

    select * from {{ ref('stg_fn9__tbhis') }}

),

intermediate as (

    select
        tit.nrocontrole,
        tit.anocontrole,
        fil.nome as filial,
        forn.nomefantasia as fornecedor,
        his.descricao as transacao,
        tit.vlrtotal,
        tit.vlrpago,
        tit.vlrsaldo,
        tit.dataemissao,
        tit.datamovto,
        tit.datavencto
    from cptit tit
    left join tbfil fil on tit.codfil = fil.codfil
    left join tbfor forn on tit.cgccpfforne = forn.cgccpfforne
    left join tbhis his on tit.codtransacao = his.codtransacao

)

select * from intermediate
