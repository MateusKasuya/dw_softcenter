CREATE VIEW FACTRC_BI AS
SELECT
	f1.nrofatura,
	f1.anofatura,
	ct.nomeconta,
	f1.datavencto,
	f1.datarecbto,
	f1.vlrfatura + COALESCE(f2.vlrfatura_integra, 0) AS vlrfatura,
	f1.vlrrecbto + COALESCE(f2.vlrrecbto_integra, 0) AS vlrrecbto,
	f1.vlrsaldo + COALESCE(f2.vlrsaldo_integra, 0) AS vlrsaldo
FROM
	factrc f1
LEFT JOIN (
	SELECT
		nrointegra,
		anointegra,
		SUM(vlrfatura) vlrfatura_integra,
		SUM(vlrrecbto) vlrrecbto_integra,
		SUM(vlrsaldo) vlrsaldo_integra
	FROM
		factrc
	GROUP BY
		nrointegra,
		anointegra
) f2
        ON
	f1.nrofatura = f2.nrointegra
	AND f1.anofatura = f2.anointegra
LEFT JOIN tbcta ct
        ON
	f1.contareduz = ct.contareduz