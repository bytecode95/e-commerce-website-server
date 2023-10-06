const express = require('express');
const router = express.Router();

const {upload} = require('../middlewares/multer')
const {addProducts, getProducts, deleteProduct, updateProduct, getoneProduct} = require('../controllers/productControllers')



router.post('/addproducts', upload, addProducts);
router.get('/getdetails',upload, getProducts);
router.get('/getdetails/:id',upload, getoneProduct);  //get one product for update
router.delete('/deleteproduct/:id', deleteProduct);
router.put('/updateproduct/:id', updateProduct);
router.get('/:id', getoneProduct);

module.exports = router;