const express = require('express')
const router = express.Router();

const {addReview, getoneproductReview} = require('../controllers/reviewController')


router.post('/review', addReview );
router.get('/getreview/:id', getoneproductReview );


module.exports = router;