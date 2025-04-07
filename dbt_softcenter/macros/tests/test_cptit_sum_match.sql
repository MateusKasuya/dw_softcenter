{% test cptit_sum_match(model, source_table, source_schema, column_name) %}
SELECT 1
FROM (
    SELECT COALESCE(ROUND(SUM({{ column_name }})::NUMERIC,1), 0) AS source_sum
    FROM {{ source(source_schema, source_table) }}
) s,
(
    SELECT COALESCE(ROUND(SUM({{ column_name }})::NUMERIC,1), 0) AS model_sum
    FROM {{ model }}
) m
WHERE s.source_sum != m.model_sum

{% endtest %}
