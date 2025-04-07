SELECT 1
FROM (
    SELECT COUNT(*) AS source_count
    FROM {{ source('fn9', 'CPTIT') }}
) s,
(
    SELECT COUNT(*) AS model_count
    FROM {{ ref('contas_pagar') }}
) m
WHERE s.source_count != m.model_count
