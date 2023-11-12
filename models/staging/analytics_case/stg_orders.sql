WITH orders AS (
    SELECT *
    FROM {{ source ('analytics_case', 'table_orders') }}
)

SELECT * FROM orders
