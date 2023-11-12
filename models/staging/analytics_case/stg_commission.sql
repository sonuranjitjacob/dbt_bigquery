WITH commission AS (
    SELECT
        productBrand,
        COALESCE(productCategory, 'Unknown') AS productCategory, {# Replacing NULL values in the column productCategory with Unknown#}
        COALESCE(commission, 0.01) AS commission {# Replacing NULL values in the column commission, taking a nominal value to check the impact of this change #}
    FROM {{ source ('analytics_case', 'table_commission') }}
)

SELECT * FROM commission

