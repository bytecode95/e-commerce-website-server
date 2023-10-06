var connection = require('../db/db-connection')

const addReview = (req, res) => {

    const { product_id, customer_id,  email,rating,description, name} = req.body;
    const sql = 'insert into product_reviews(product_id,customer_id,email,rating,description,name) values (?, ?, ?, ?, ?, ?);'
    connection.query(sql,[product_id, customer_id,  email,  rating,description, name], (err, rows) => {
        if (err) {
            //console.log('Error:', err);
            res.status(500).json({ error: 'Error inserting reviews' });
          } else {
            //console.log('review added sucessfully');
            res.json({ message: 'review added sucessfully' });
          }
      })
}

const getoneproductReview = async (req, res) => {
    try{
        connection.query('select * from product_reviews where product_id=?;',[req.params.id] ,(err, rows) => {
          if(err) throw err
          //console.log(rows)
          res.json(rows);
        });
    
      }catch{

        res.status(500).send();
      }

}



module.exports = {addReview, getoneproductReview}