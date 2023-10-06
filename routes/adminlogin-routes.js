const express = require('express')
const router = express.Router();

const {adminLogin, adminSignup, showadminPanel} = require('../controllers/adminlogin-controller')


router.post('/signup', adminSignup );
router.post('/login',adminLogin);



router.get('/adminpanel', showadminPanel)

module.exports = router;