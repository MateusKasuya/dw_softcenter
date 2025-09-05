CREATE VIEW CPTIT_BI AS
SELECT
	cpt.nrocontrole,
	cpt.anocontrole,
	fil.nome AS nome_filial,
	forr.nomefantasia AS nome_fornecedor,
	his.descricao AS descricao_transacao,
	cpt.vlrtotal,
	cpt.vlrtotal - cpt.vlrsaldo AS vlrpago,
	cpt.vlrsaldo,
	cpt.dataemissao,
	cpt.datamovto,
	cpt.datavencto,
	CASE
		WHEN cpt.vlrsaldo = 0 THEN 'Pago'
		WHEN cpt.vlrsaldo > 0
		AND CAST('NOW' AS TIMESTAMP) <= CAST(cpt.datavencto AS TIMESTAMP) THEN 'A Pagar'
		ELSE 'Em Atraso'
	END AS condicao_fatura
FROM
	cptit cpt
LEFT JOIN tbfil fil
        ON
	cpt.codfil = fil.codfil
LEFT JOIN tbfor forr
        ON
	cpt.cgccpfforne = forr.cgccpfforne
LEFT JOIN tbhis his
        ON
	cpt.codtransacao = his.codtransacao
