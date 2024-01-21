-- Calculate the total revenue for each product in descending order
SELECT
    product_id,
    product_description,
    SUM(quantity * unit_price) AS total_revenue -- total revenue calculated
FROM
    customer_orders
GROUP BY
    product_id, product_description
ORDER BY
    total_revenue DESC; -- sorted in descending order by total revenue