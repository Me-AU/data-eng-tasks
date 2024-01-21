-- Select top 5 customers with highest total purchases
SELECT
    customer_id,
    SUM(quantity * unit_price) AS total_purchases -- total purchases calculated
FROM
    customer_orders
GROUP BY
    customer_id
ORDER BY
    total_purchases DESC -- sorted in descending order
LIMIT 5; -- showing only top 5 customers