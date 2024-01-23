db.createCollection("order_data", {
    validator: {
      $jsonSchema: {
        bsonType: "object",
        required: ["customer_id", "customer_name", "order_id", "order_date", "shipment_date", "product_id", "product_description", "quantity", "unit_price"],
        properties: {
          customer_id: {
            bsonType: "string",
            description: "Unique identifier for the customer - Required."
          },
          customer_name: {
            bsonType: "string",
            description: "Name of the customer - Required."
          },
          order_id: {
            bsonType: "int",
            description: "Unique identifier for the order - Required."
          },
          order_date: {
            bsonType: "date",
            description: "Date of the order - Required."
          },
          shipment_date: {
            bsonType: "date",
            description: "Date of shipment - Required."
          },
          product_id: {
            bsonType: "string",
            description: "Unique identifier for the product - Required."
          },
          product_description: {
            bsonType: "string",
            description: "Description of the product - Required."
          },
          quantity: {
            bsonType: "int",
            description: "Quantity of product ordered - Required."
          },
          unit_price: {
            bsonType: "number",
            description: "Unit price for a single quantity of product - Required."
          }
        }
      }
    }
  })