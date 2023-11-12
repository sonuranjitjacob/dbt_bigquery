WITH
orders AS (SELECT * FROM {{ ref('stg_orders') }}),

commission AS (SELECT * FROM {{ ref('stg_commission') }})

SELECT
    EXTRACT(YEAR FROM orderDate) AS year,
    SUM(orderTotalPrice) AS sales,
    SUM(orderTotalPrice * commission.commission) AS grossProfit
FROM
    orders JOIN commission
    ON
        orders.productCategory = commission.productCategory
        AND orders.productBrand = commission.productBrand
GROUP BY 1
