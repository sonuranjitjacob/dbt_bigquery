/* This test checks how many orders do not have a corresponding commission value in the commission table */

{{ config(error_if = '>20') }}
{{ config(warn_if = '>=1') }}

SELECT
    o.productBrand AS orders_productBrand,
    o.productCategory AS orders_productCategory,
    c.productBrand AS commission_productBrand,
    c.productCategory AS commission_productCategory,
    c.commission AS commission
FROM {{ source ('analytics_case', 'table_commission') }} AS c
INNER JOIN {{ source ('analytics_case', 'table_orders') }} AS o
    ON
        o.productBrand = c.productBrand
        AND o.productCategory = c.productCategory
WHERE
    c.commission IS NULL
