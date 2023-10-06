var connection = require('../db/db-connection')

const orderItemAnalysis = (req, res) => {
  
  connection.query('select order_items.product_id, order_items.quantity, products.pro_name from order_items inner join products on order_items.product_id  = products.id;', (err, rows)=> {
    if (err) {
      //console.log("error: ", err);
      throw err;
    }
    //console.log(rows);
    res.send(rows);
  });
};

const orderAnalysis = (req, res) => {
  connection.query('select orders.order_id, orders.total_amount,orders.shipping_address, user_signup.username, orders.order_date from orders inner join user_signup on orders.user_id = user_signup.user_id;', (err, rows)=>{
    if (err) {
      //console.log("error: ", err);
      throw err;
    }
    //console.log(rows);
    res.send(rows);
  });
}


module.exports = {orderItemAnalysis, orderAnalysis};