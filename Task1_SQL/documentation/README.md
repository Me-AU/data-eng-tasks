# Steps From Scratch
All the steps taken since the start of this task are documented here.

## Create Folder Structure

``` markdown
Task1_SQL/
├── sql_queries/
│   ├── subtask1_query.sql
│   └── subtaskN_query.sql
│
├── data/
│   └── customer_dataset.csv
│
├── documentation/
│   └── README.md
│   └── SETUP.md
``` 

- **SQL_Queries Subdirectory:** Folder to contain all queries related to Task1.
- **Data Subdirectory:** Folder to contain all data related to Task1.
- **Documentation Subdirectory:** Folder to contain all docs related to Task1.
- **README.md File:** File to document all steps taken to complete Task1.
- **SETUP.md File:** File to document setup instructions for testers/contributors to Task1.

## Import Customer Dataset to PostgreSQL

- Open pgAdmin, connect to your PostgreSQL server, and create a database ```customers```.
- Go to the Query Tool of this db and create a table according to the CSV's schema by the SQL query:

```sql
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
```

- Import the Task1_SQL/data/customer_dataset.csv file by the following query in the Query Tool:

```sql
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
```