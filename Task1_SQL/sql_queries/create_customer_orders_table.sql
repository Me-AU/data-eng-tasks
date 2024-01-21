CREATE TABLE customer_orders ( -- creating table according to the CSV columns
    customer_id VARCHAR(12), -- VARCHAR is used for all alphanumeric columns
    customer_name VARCHAR(100),
    order_id VARCHAR(12),
    order_date DATE, -- DATE used for both date columns
    shipment_date DATE,
    product_id VARCHAR(18),
    product_description VARCHAR(255),
    quantity INTEGER,
    unit_price MONEY -- MONEY used for unit_price column, with the default currency set to $ (can be changed if needed)
);