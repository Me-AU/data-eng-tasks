EXPLAIN
SELECT
    customer_id,
    SUM(quantity * unit_price) AS total_purchases
FROM
    customer_orders
GROUP BY
    customer_id
ORDER BY
    total_purchases DESC
LIMIT 5;
