WITH
fn9 AS (

    SELECT
        frctrc.*,
        'FN9' AS empresa
    FROM {{ ref('int_fn9_frctrc_joined') }} frctrc


),

mgp AS (

    SELECT
        frctrc.*,
        'MGP' AS empresa
    FROM {{ ref('int_mgp_frctrc_joined') }} frctrc


),

rcr AS (

    SELECT
        frctrc.*,
        'RCR' AS empresa
    FROM {{ ref('int_rcr_frctrc_joined') }} frctrc

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
