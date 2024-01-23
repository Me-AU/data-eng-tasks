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
   ```javascript
   use customer
   ```

3. Create a collection named `order_data`:
   ```javascript
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

   