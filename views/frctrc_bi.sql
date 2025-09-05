CREATE VIEW FRCTRC_BI AS
SELECT
	fr.nroctrc,
	fr.ufctrc,
	fr.dataemissao,
	fr.situacao,
	        CASE
		fr.indctetpcte
            WHEN '0' THEN 'Normal'
		WHEN '1' THEN 'Complementar'
		WHEN '2' THEN 'Anulação'
		WHEN '3' THEN 'Substituição'
		ELSE fr.indctetpcte
	END AS tipo_cte,
	fil.nome AS filial,
	fr.cgccpfdestina,
	cli.nomefantasia AS cliente,
	cid.nome AS cidade,
	cid.coduf,
	CASE
		WHEN cid.coduf IN ('AC', 'AP', 'AM', 'PA', 'RO', 'RR', 'TO') THEN 'Norte'
		WHEN cid.coduf IN ('AL', 'BA', 'CE', 'MA', 'PB', 'PE', 'PI', 'RN', 'SE') THEN 'Nordeste'
		WHEN cid.coduf IN ('DF', 'GO', 'MT', 'MS') THEN 'Centro-Oeste'
		WHEN cid.coduf IN ('ES', 'MG', 'RJ', 'SP') THEN 'Sudeste'
		WHEN cid.coduf IN ('PR', 'RS', 'SC') THEN 'Sul'
	END AS regiao,
	cid.nome || '-' || cid.coduf AS cidade_uf,
	'Brasil,' || cid.nome || ',' || cid.coduf AS localizacao_mapa,
	pro.nome AS produto,
	pesofrete / 1000.0 AS pesofrete_ton,
	fr.vlrtotfrete,
	fr.vlrpedagio,
	fr.vlrimposto,
	fa.datavencto,
	fa.datarecbto,
	fa.datarecbto - fr.dataemissao AS dias_recebimento,
	fa.vlrfatura,
	fa.vlrrecbto,
	fa.vlrsaldo,
	CASE
		WHEN fr.situacao = 'Normal' THEN 'Ag. Fatura'
		WHEN fr.situacao = 'Faturado'
		AND CAST(fa.datavencto AS TIMESTAMP) < CAST('NOW' AS TIMESTAMP)
		AND fa.vlrsaldo > 0 THEN 'Em Atraso'
		WHEN fr.situacao = 'Faturado'
		AND fa.vlrsaldo = 0 THEN 'Recebida'
		ELSE 'A Receber'
	END AS condicao_fatura,
	fa.nomeconta AS conta_fatura
FROM
	frctrc fr
LEFT JOIN tbfil fil
        ON
	fr.codfilemite = fil.codfil
LEFT JOIN tbcli cli
        ON
	fr.cgccpfdestina = cli.cgccpfcli
LEFT JOIN tbcid cid
        ON
	fr.codciddes = cid.codcid
LEFT JOIN tbpro pro
        ON
	fr.codpro = pro.codpro
LEFT JOIN factrc_bi fa
        ON
		fr.nrofatura = fa.nrofatura
	AND fr.anofatura = fa.anofatura
