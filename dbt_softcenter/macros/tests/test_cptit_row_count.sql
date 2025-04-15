{% test cptit_row_count(model, source_table, source_schema, nome_empresa) %}

SELECT 1
FROM (
    SELECT COUNT(*) AS source_count
    FROM {{ source(source_schema, source_table) }}
) s,
(
    SELECT COUNT(*) AS model_count
    FROM {{ model }}
    WHERE empresa = '{{ nome_empresa }}'
) m
WHERE s.source_count != m.model_count

{% endtest %}
