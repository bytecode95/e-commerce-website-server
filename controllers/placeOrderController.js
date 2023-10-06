
const createDBConnection = require('../db/dbConnection')

const placeOrder = async ( userID,userDetails) => {
    const sql = 'insert into orders (total_amount, shipping_address, user_id, status, payment_method) values (?, ?, ?, ?, ?) ;'
    const params = [userDetails.total_amount,  userDetails.shipping_address, userID, 'pending', 'Cash on Delivery']
   try{
    const connection = await createDBConnection();
    const [result] = await connection.execute(sql, params);
   
    //console.log('Order details updated successfully');
    //console.log(result)
    const orderId = result.insertId;
    
    // Insert order items into the 'order_items' table
    for (const orderItem of userDetails.orderItems) {
      const totalPrice = orderItem.nProduct*orderItem.price;
      const orderItemSql = 'insert into order_items (order_id, product_id, quantity, unit_price, total_price) values (?, ?, ?, ?, ?);'
      const orderItemParams = [orderId, orderItem.id, orderItem.nProduct, orderItem.price, totalPrice];
      await connection.execute(orderItemSql, orderItemParams);
    }
    console.log('Order details and order items updated successfully');
    return {result, orderId }; // Return the generated order_id and result
   } 
   catch (err) {
    throw err;
   } 
  }



module.exports = {placeOrder};
