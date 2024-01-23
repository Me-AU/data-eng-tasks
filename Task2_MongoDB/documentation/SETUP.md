# Testing Instructions

Follow these steps to set up and test the MongoDB tasks:

## Prerequisites

- MongoDB installed on your machine. You can download it [here](https://www.mongodb.com/try/download/community). From MongoDB, you also need to:
    - Download [mongosh](https://www.mongodb.com/try/download/shell)
    - Download [mongoimport](https://www.mongodb.com/try/download/database-tools)
- Git installed on your machine. You can download it [here](https://git-scm.com/downloads).

## Basic Setup

1. Clone the repository (if not done yet), and switch to the Task2_MongoDB folder:
   ```bash
   git clone "https://github.com/Me-AU/data-eng-tasks"
   cd Task2_MongoDB
   ```

2. Import the dataset to MongoDB:
   - *Follow the steps in [this heading of README.md](README.md#import-customer-dataset-to-mongodb)*

## Task 1: Schema Design

Review the proposed MongoDB collection schema for storing the order data:

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

*Explanation and reasoning for the schema design, as well as Schema Validation methods are in [Sub-Task 1 heading of README.md](README.md#sub-task-1-schema-design)*

## Task 2: Model Creation

In [Sub-Task 2 heading of README.md](README.md#sub-task-2-model-creation), check:

1. Reasonings for target variable selection.
2. List of extracted features (basic and derived).
3. Summary of dataset analysis for ML model.

## Task 3: Data Updation

1. Import the dataset (if not already done in Task 1).
2. Run this query to update shipment_date for a known order_id:

```js
db.order_data.updateOne(
   { order_id: 1065 },  // sample order_id
   {
      $set: {
         shipment_date: ISODate("2014-01-31")  // sample shipment_date
      }
   }
)
```

*Explanation, result, and confirmation of the data updation query are in [Sub-Task 3 heading of README.md](README.md#sub-task-3-data-updation)*

## Task 4: Data Addition

1. Import the dataset (if not already done in Task 1).
2. Run this query to add new orders to the collection (change attribute values according to the new order):

```js
db.order_data.insertOne({
   customer_id: 'CUST123',
   customer_name: 'John Doe',
   order_id: 2001,
   order_date: '2024-01-20',
   shipment_date: '2024-01-25',
   product_id: 'PROD456',
   product_description: 'Sample Product',
   quantity: 3,
   unit_price: 25.99
});
```

*Explanation, result, and confirmation of the data addition query are in [Sub-Task 4 heading of README.md](README.md#sub-task-4-data-addition)*

---
---
Happy testing!