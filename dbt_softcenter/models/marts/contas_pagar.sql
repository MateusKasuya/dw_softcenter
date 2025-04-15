{{
    config(
        materialized = 'incremental',
        unique_key = ['nrocontrole', 'anocontrole'],
        on_schema_change = 'append_new_columns'
    )
}}

WITH max_data AS (

    SELECT COALESCE(MAX(datatlz), '1900-01-01') AS max_datatlz
    FROM {{ this }}

),

fn9 AS (

    SELECT
        cptit.*,
        'FN9' AS empresa
    FROM {{ ref('int_fn9_cptit_joined') }} cptit
    {% if is_incremental() %}
    CROSS JOIN max_data
    WHERE cptit.datatlz >= max_data.max_datatlz
    {% endif %}

),

mgp AS (

    SELECT
        cptit.*,
        'MGP' AS empresa
    FROM {{ ref('int_mgp_cptit_joined') }} cptit
    {% if is_incremental() %}
    CROSS JOIN max_data
    WHERE cptit.datatlz >= max_data.max_datatlz
    {% endif %}

),

marts AS (

    SELECT *
    FROM fn9

    UNION ALL

    SELECT *
    FROM mgp

)

SELECT *
FROM marts
