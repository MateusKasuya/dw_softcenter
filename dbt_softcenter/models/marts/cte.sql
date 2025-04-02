WITH fn9 AS (

    SELECT
        *,
        'FN9' AS empresa
    FROM {{ ref('int_fn9_frctrc_joined') }}

),

marts AS (

    SELECT *
    FROM fn9

)

SELECT *
FROM marts
