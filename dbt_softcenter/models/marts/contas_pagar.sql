
WITH
fn9 AS (

    SELECT
        cptit.*,
        'FN9' AS empresa
    FROM {{ ref('int_fn9_cptit_joined') }} cptit

),

mgp AS (

    SELECT
        cptit.*,
        'MGP' AS empresa
    FROM {{ ref('int_mgp_cptit_joined') }} cptit

),

rcr AS (

    SELECT
        cptit.*,
        'RCR' AS empresa
    FROM {{ ref('int_rcr_cptit_joined') }} cptit

),

marts AS (

    SELECT *
    FROM fn9

    UNION ALL

    SELECT *
    FROM mgp

    UNION ALL

    SELECT *
    FROM rcr

)

SELECT *
FROM marts
