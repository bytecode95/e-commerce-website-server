const express = require('express')
const router = express.Router();

const {userSignup, userLogin, userContact} = require('../controllers/userloginController')
const {verifyToken} = require('../middlewares/authMiddlewares')

router.post('/signup', userSignup );
router.post('/login', userLogin );
router.get('/getuserInfor/:id', verifyToken , async(req,res)=>{
    const userID = req.userid;
    //console.log(userID);
    try {
        await userContact(res, userID);
        //console.log('user ID was taken')
        
      } catch (error) {
       
        console.error('Error getting user details:', error);
    
      }
});

module.exports = router;