-- Creating an index on the customer_id column to optimize grouping
CREATE INDEX idx_customer_id ON customer_orders(customer_id);