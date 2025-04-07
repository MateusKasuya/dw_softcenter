{% test frctrc_row_count(model, source_table, source_schema) %}

SELECT 1
FROM (
    SELECT COUNT(*) AS source_count
    FROM {{ source(source_schema, source_table) }}
    WHERE situacao IN ('N', 'F')
) s,
(
    SELECT COUNT(*) AS model_count
    FROM {{ model }}
) m
WHERE s.source_count != m.model_count

{% endtest %}
