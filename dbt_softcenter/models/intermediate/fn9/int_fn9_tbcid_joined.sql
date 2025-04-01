with tbcid as (

    select * from {{ ref('stg_fn9__tbcid') }}

),

ibge as (

    select * from {{ ref('stg_ibge__municipios') }}

),

intermediate as (

select
    tbcid.codcid,
    tbcid.nome,
    ibge.mesorregiao,
    tbcid.coduf,
    ibge.regiao,
    tbcid.cidade_uf,
    tbcid.localizacao_pbi
from tbcid
left join ibge on tbcid.codibge = ibge.id

)

select * from intermediate
