# Steps From Scratch - Task 2: MongoDB

All the steps taken since the start of Task 2 are documented here.

## Create Folder Structure

```markdown
Task2_MongoDB/
├── queries/
│   ├── subtask1_query.js
│   └── subtaskN_query.js
│
├── data/
│   └── customer_dataset.csv
│
├── documentation/
│   └── README.md
│   └── SETUP.md
```

- **Queries Subdirectory:** Folder to contain all MongoDB queries related to Task 2.
- **Data Subdirectory:** Folder to contain all data related to Task 2.
- **Documentation Subdirectory:** Folder to contain all docs related to Task 2.
- **README.md File:** File to document all steps taken to complete Task 2.
- **SETUP.md File:** File to document setup instructions for testers/contributors to Task 2.

## Import Customer Dataset to MongoDB

1. Open the `mongosh` shell.

2. Connect to your MongoDB server and use the following command to create `customer` database if it does not exist:
   ```js
   use customer
   ```

3. Create a collection named `order_data`:
   ```js
   db.createCollection('order_data') // creates 'order_data' collection
   ```

4. Import the `customer_dataset.csv` file using the following windows shell command:
   ```shell
    mongoimport --db customer --collection order_data --type csv --headerline --file 'C:/Users/ahsan/Downloads/data-eng-tasks/Task2_MongoDB/data/customer_dataset.csv'
   ```

   ![mongoimport](mongoimport.png)

5. Verify in mongosh that the data has been imported successfully:
   ```js
   db.order_data.find() // returns documents in this collection

   db.order_data.countDocuments() // returns 280 i.e the number of imported documents
   ```

## Sub-Task 1: Schema Design

### Schema 

```json
{
  "_id": ObjectId, 
  "customer_id": String,
  "customer_name": String,
  "order_id": Number,
  "order_date": ISODate,
  "shipment_date": ISODate,
  "product_id": String,
  "product_description": String,
  "quantity": Number,
  "unit_price": Number
}
```

### Explanation

- **_id:** MongoDB automatically adds this field as the primary key. It's an ObjectId and ensures the uniqueness of each document.

- **customer_id:** String type, representing the unique identifier for the customer.

- **customer_name:** String type, storing the name of the customer.

- **order_id:** Number type, representing the unique identifier for each order.

- **order_date:** ISODate type, storing the order date in the ISO date format.

- **shipment_date:** ISODate type, storing the shipment date in the ISO date format.

- **product_id:** String type, representing the unique identifier for the product.

- **product_description:** String type, providing a description of the product.

- **quantity:** Number type, indicating the quantity of the product ordered.

- **unit_price:** Number type, storing the unit price for a single quantity of the product.

### Considerations

- MongoDB uses BSON (Binary JSON) to store documents, and the data types align with BSON types.

- Using ObjectId as the primary key ensures unique identification of each document.

- ISODate is used to store date values in a standard format.

- Numeric fields (order_id, quantity, unit_price) are represented using the Number data type.

