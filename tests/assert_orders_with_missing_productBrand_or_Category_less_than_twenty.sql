/* This test checks how many orders do not have a corresponding productBrand or productCategory in the commission table */


{{ config(error_if = '>20') }}
{{ config(warn_if = '>=10') }}

SELECT o.productBrand as count_orders_with_productBrand_or_productCategory_not_in_commission
FROM {{ source ('analytics_case', 'table_orders') }}  AS o
LEFT JOIN {{ source ('analytics_case', 'table_commission') }} AS c
    ON
        o.productBrand = c.productBrand
        AND o.productCategory = c.productCategory
WHERE
    c.productBrand IS NULL
    AND c.productCategory IS NULL
