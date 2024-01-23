db.order_data.updateOne(
    { order_id: 1065 },  // sample order_id
    {
       $set: {
          shipment_date: ISODate("2014-01-31")  // sample shipment_date
       }
    }
)