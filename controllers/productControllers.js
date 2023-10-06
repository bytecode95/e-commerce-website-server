//db connection
var connection = require('../db/db-connection')

const addProducts = (req, res) => {
    if(!req.file){
        console.log('No files were uploded!');
    }else{
        console.log(req.file.filename)
    
    }

    connection.query('insert into products (pro_image, pro_name, quantity, price,description ) values (?,?,?,?,?);',[req.file.filename, req.body.name, req.body.qty,req.body.price, req.body.desc], (err, results) => {
        if (err) {
            console.log("error")
        }else{
            res.status(200).send(results);
            console.log("File Uploaded!")
        }
        
    })     
}

const getProducts = (req, res) => {
	
    connection.query('select * from products;', (err, rows) => {
        if (err) throw err
      
        res.json(rows);
      })
}


const getoneProduct = (req, res) => {

    connection.query('select * from products where id=?;',[req.params.id], (err, rows) => {
        if (err) throw err
      
        res.json(rows);
      })
}



const deleteProduct = (req, res) => {
    connection.query('delete from products where id=?;',[req.params.id], (err, rows) => {
        if (err) throw err
  
        res.json(rows);
      })
}



const updateProduct = (req, res) => {

    
    const productId = req.body.id;
    console.log(productId)
    const { pro_name, price, quantity} = req.body;
    const sql = 'update products set pro_name = ?, price = ?,  quantity=? where id = ?;'
    connection.query(sql,[pro_name, price, quantity,  productId], (err, rows) => {
        if (err) {
            //console.log('Error:', err);
            res.status(500).json({ error: 'Error updating product' });
          } else {
            //console.log('Product updated successfully');
            res.json({ message: 'Product updated successfully' });
          }
      })
}
module.exports = {addProducts, getProducts, deleteProduct, updateProduct, getoneProduct}