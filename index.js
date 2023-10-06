const express = require('express')
var bodyParser = require('body-parser')
var cors = require('cors')
const app = express()
const port = 4000

app.use(cors())

// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }))

// parse application/json
app.use(bodyParser.json())

//routes applications
const admin = require('./routes/adminlogin-routes')
const router = require('./routes/productRouters')
const user = require('./routes/userloginRoutes')
const details = require('./routes/orderInforRoutes')
const verify = require('./routes/tokenverifyRouter')
const confirm = require('./routes/placeOrderRouter')
const order =  require('./routes/adminorderRouter')
const review = require('./routes/reviewRouter')


app.use('/uploads', express.static('./uploads'));
app.use('/api', admin);
app.use('/api/login', verify);
app.use('/api', router);
app.use('/api/user', user);
app.use('/api', details);
app.use('/api', confirm);
app.use('/api/order', order);
app.use('/api', review);



  
app.listen(port, () => {
  console.log(`New app listening on port ${port}`)
})