WITH cte AS (

    SELECT
        dataemissao
    FROM {{ ref('cte') }}

),

agg_data AS (

    SELECT
        MIN(dataemissao) AS data_min,
        MAX(dataemissao) AS data_max
    FROM cte

),

ano_data AS (

    SELECT
        EXTRACT(YEAR FROM data_min)::INT AS ano_inicio,
        EXTRACT(YEAR FROM data_max)::INT AS ano_fim
    FROM agg_data

),

make_date AS (

    SELECT
        MAKE_DATE(ano_inicio, 1, 1)   AS data_inicio,
        MAKE_DATE(ano_fim, 12, 31)    AS data_fim
    FROM ano_data

),

generate_series AS (

    SELECT
        GENERATE_SERIES(data_inicio, data_fim, '1 day'::INTERVAL)::DATE AS data
    FROM make_date

),

calendario AS (

    SELECT
        data,
        EXTRACT(YEAR FROM data) AS ano,
        EXTRACT(MONTH FROM data) AS mes,

        CASE EXTRACT(MONTH FROM data)
            WHEN 1  THEN 'Janeiro'
            WHEN 2  THEN 'Fevereiro'
            WHEN 3  THEN 'Março'
            WHEN 4  THEN 'Abril'
            WHEN 5  THEN 'Maio'
            WHEN 6  THEN 'Junho'
            WHEN 7  THEN 'Julho'
            WHEN 8  THEN 'Agosto'
            WHEN 9  THEN 'Setembro'
            WHEN 10 THEN 'Outubro'
            WHEN 11 THEN 'Novembro'
            WHEN 12 THEN 'Dezembro'
        END AS mes_nome,

        CASE EXTRACT(MONTH FROM data)
            WHEN 1  THEN 'Jan'
            WHEN 2  THEN 'Fev'
            WHEN 3  THEN 'Mar'
            WHEN 4  THEN 'Abr'
            WHEN 5  THEN 'Mai'
            WHEN 6  THEN 'Jun'
            WHEN 7  THEN 'Jul'
            WHEN 8  THEN 'Ago'
            WHEN 9  THEN 'Set'
            WHEN 10 THEN 'Out'
            WHEN 11 THEN 'Nov'
            WHEN 12 THEN 'Dez'
        END || '/' || RIGHT(EXTRACT(YEAR FROM data)::TEXT, 2) AS mes_ano,

        CASE
            WHEN EXTRACT(MONTH FROM data) = EXTRACT(MONTH FROM CURRENT_DATE)
             AND EXTRACT(YEAR FROM data) = EXTRACT(YEAR FROM CURRENT_DATE)
            THEN TRUE
            ELSE FALSE
        END AS mes_atual,

        EXTRACT(DAY FROM data) AS dia

    FROM generate_series

)

SELECT *
FROM calendario
