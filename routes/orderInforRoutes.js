const express = require('express')
const router = express.Router();

const {verifyToken} = require('../middlewares/authMiddlewares')
const {userAddress, getuserInformation} = require('../controllers/orderInforController')


router.post('/orderinfo', verifyToken, async(req,res)=>{
    const userID = req.userid;
    const userDetails = req.body;
    console.log(userID);
    console.log(userDetails);
    try {
        userAddress(res, userID, userDetails);
        console.log('User details inserted successfully')
        //res.json({ message: 'User details inserted successfully' });
      } catch (error) {
        console.error('Error inserting user details:', error);
        //res.status(500).json({ error: 'Error inserting user details' });
      }
});

router.get('/getInfor/:id', verifyToken, async(req,res)=>{
 
  try {
    // Extract the user ID from the URL parameter
    const userID = req.userid;

    console.log(userID)
    // Call the getuserInformation function with the extracted user ID
    const userInfo = await getuserInformation(res, userID);

    // Send the user information as a JSON response
    //res.status(200).json(userInfo);
  } catch (error) {
      console.error('Error taking user details:', error);
    if (res) {
      console.log('Error fetching user information')
      res.status(500).json({ error: 'Error fetching user information' });
    }
  }
});

module.exports = router;