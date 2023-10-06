const express = require('express')
const router = express.Router();

const {verifyToken} = require('../middlewares/authMiddlewares')
const {placeOrder} = require('../controllers/placeOrderController')


router.post('/placeorder', verifyToken, async(req,res)=>{
    const userID = req.userid;
    const userDetails = req.body;
    //console.log(userID);
    //console.log(userDetails);
    //console.log(userDetails.orderItems);
    try {
        await placeOrder( userID,userDetails);
        res.status(200).json({ status: 'success', message: 'Order placed successfully' });
        //console.log('data submitted')
      } catch (error) {
        res.status(500).json({ status: 'error', message: 'Error placing the order' });
        //console.error('Error inserting user details:', error);
    
      }
});




module.exports = router;