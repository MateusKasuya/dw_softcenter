SELECT 1
FROM (
    SELECT COUNT(*) AS source_count
    FROM {{ source('fn9', 'FRCTRC') }}
    WHERE situacao IN ('N', 'F')
) s,
(
    SELECT COUNT(*) AS model_count
    FROM {{ ref('cte') }}
) m
WHERE s.source_count != m.model_count
