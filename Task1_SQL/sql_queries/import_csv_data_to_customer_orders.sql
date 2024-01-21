SET datestyle TO iso, dmy; -- default postgreSQL datestyle is ymd, adjusting it according to the CSV file

COPY customer_orders ( -- copying CSV file contents; MUST change the path according to your PC when testing
    customer_id,
    customer_name,
    order_id,
    order_date,
    shipment_date,
    product_id,
    product_description,
    quantity,
    unit_price
)
FROM 'C:/Users/ahsan/Downloads/data-eng-tasks/Task1_SQL/data/customer_dataset.csv'
DELIMITER ',' -- specifying delimiter used in CSV file
CSV HEADER; -- ensuring the first column is skipped as it is the header