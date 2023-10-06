const express = require('express')
const router = express.Router();

const {orderItemAnalysis,orderAnalysis } = require('../controllers/adminorderController');



router.get('/admincharts' , orderItemAnalysis)
router.get('/orderanalysis' , orderAnalysis)

module.exports = router;