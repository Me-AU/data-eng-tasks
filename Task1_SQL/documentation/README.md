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

## Choice of RDBMS:
PostgreSQL is being used because of the following reasons:
-	Query performance optimization features (helps in Task 1.1)
-	Maintainability, since it has a robust community of developers and contributors (low risk of the need to shift to a different RDBMS, which is a costly procedure)
-	Scalability features (helps us as the e-commerce customer base expands with time)


## Import Customer Dataset to PostgreSQL

- Open pgAdmin, connect to your PostgreSQL server, and create a database ```customers```.
- Go to the Query Tool of this db:
  
![Query Tool](query-tool.png)

and create a table according to the CSV's schema by the SQL query:

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

COPY customer_orders ( -- copying CSV file contents; **MUST** change the path according to your PC when testing
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

## Sub-Task 1: Query Optimization

### Create the Query

- In the Query Tool, run the following query to get top 5 paying customers in descending order:

```sql
-- Select top 5 customers with highest total purchases in descending order
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
```

![Top 5 Customers](top-5-customers.png)

### Optimize the Query 

- To further optimize this query, we check its Query Plan by using the following query:

```sql
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
```

![Query Plan](query-plan.png)

Since our dataset is small, the costs occurring are nominal. 

Considering the possibility of this dataset (customer orders) growing over time, we have two options: 
- Using Materialized Views (MVs):
    - The nature of our dataset is that it would be changing continuously as new orders come, making MVs expensive to refresh.
    - The MV is specific to this query, and does not help in any other queries.
- Indexing:
    - Indexing requires an overhead with each write operation, which is better compared to MVs' expense.
    - The indexing would increase efficiency in other queries as well, that use the indexed columns.

As optimization is required in the case of a larger dataset, we should consider the proportional increase in costs for the Seq Scan required for the GROUP BY clause. Thus, we index the customer_id by query:

```sql
-- Creating an index on the customer_id column to optimize grouping
CREATE INDEX idx_customer_id ON customer_orders(customer_id);
```

## Sub-Task 2: Data Transformation

- In the Query Tool, run the following query to get total revenue of each product in descending order:

```sql
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
```

![Total Product Revenues](total-product-revenues.png)

## Sub-Task 3: Database Design

The schema is in ***3NF*** (Third Normal Form) as:
- Each table has atomic (indivisible) values in each column, with no repeating groups.
- There are no partial dependencies in any table.
- There are no transitive dependencies between non-prime attributes.

Further normalization is not required in general cases.

### Tables

1. **Customers Table:**

> | customer_id | customer_name        |
> |-------------|----------------------|
> | VARCHAR [PK]| VARCHAR              |

2. **Orders Table:**

> | order_id | customer_id | order_date | shipment_date |
> |----------|-------------|------------|---------------|
> | VARCHAR [PK] | VARCHAR [FK] | DATE     | DATE          |

3. **Products Table:**

> | product_id | product_description | unit_price |
> |------------|----------------------|------------|
> | VARCHAR [PK] | VARCHAR             | MONEY |

4. **OrderDetails Table:**

> | order_id | product_id | quantity |
> |----------|------------|----------|
> | VARCHAR [PK, FK] | VARCHAR [PK, FK] | INTEGER  |

### Relationships

1. Customers Table
- **Primary Key:** `customer_id`
- **Relationships:**
  - One customer can place many orders (One-to-Many with `Orders(customer_id)`).

2.  Products Table
- **Primary Key:** `product_id`
- **Relationships:**
  - One product can be included in multiple order details (One-to-Many with `OrderDetails(product_id)`).

3.  Orders Table
- **Primary Key:** `order_id`
- **Foreign Keys:**
  - `customer_id` references `Customers(customer_id)`
- **Relationships:**
  - One order can have multiple order details (One-to-Many with `OrderDetails(order_id)`).
  - Many orders can belongs to one customer (Many-to-One with `Customers(customer_id)`).

4.  OrderDetails Table
- **Primary Key:** `(order_id, product_id)`
- **Foreign Keys:**
  - `order_id` references `Orders(order_id)`
  - `product_id` references `Products(product_id)`
- **Relationships:**
  - Many order details can belongs to one order (Many-to-One with `Orders(order_id)`).
  - Many order details can relate to one product (Many-to-One with `Products(product_id)`).

### Schema ERD (Entity-Relationship Diagram)

We use DBML (Database Markdown Language) to quickly generate our ERD using [dbdiagram.io]("https://dbdiagram.io").

```sql
Table Customers {
  customer_id VARCHAR [pk]
  customer_name VARCHAR
}

Table Orders {
  order_id VARCHAR [pk]
  customer_id VARCHAR [ref: > Customers.customer_id]
  order_date DATE
  shipment_date DATE
}

Table Products {
  product_id VARCHAR [pk]
  product_description VARCHAR
  unit_price MONEY
}

Table OrderDetails {
  order_id VARCHAR [pk, ref: > Orders.order_id]
  product_id VARCHAR [pk, ref: > Products.product_id]
  quantity INTEGER
}
```

![Schema ERD](ERD.png)

## Sub-Task 4: Indexing

### Importance of Indexing in a Database

Indexing is crucial for optimizing database performance by facilitating faster data retrieval, efficient search operations, improved sorting and grouping, enhanced join performance, and boosted aggregation function performance.

**Note:** The cost of these benefits is an added overhead in every WRITE query.

### Columns in the customer_orders Table That Should Be Indexed

1. **customer_id:**
   - Reason: Optimize searches for specific customers.
   - Query: `CREATE INDEX idx_customer_id ON customer_orders (customer_id);` (as used in Sub Task 1)

2. **product_id:**
   - Reason: Improve performance of queries involving product_id.
   - Query: `CREATE INDEX idx_product_id ON customer_orders (product_id);`

3. **order_date and shipment_date:**
   - Reason: Enhance efficiency of date-based filtering.
   - Query: `CREATE INDEX idx_order_date ON customer_orders (order_date);`  
            `CREATE INDEX idx_shipment_date ON customer_orders (shipment_date);`
