var connection = require('../db/db-connection')
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');

const userSignup = async (req, res) => {
  try{
    const hashedPassword = await bcrypt.hash(req.body.password, 10);
    connection.query('insert into user_signup(username, email, password ) values (?, ?, ?)',[req.body.username, req.body.email, hashedPassword], (err, rows) => {
      if(err) throw err
    
      res.json(rows);
    });
  }catch{
      res.status(500).send();
  }
   
}

const userLogin = async(req, res) => {
  const { password } = req.body;
  
  
    connection.query('select * from user_signup where username=?;',[req.body.username], (err, result) => {
      //console.log(result)
      if(!result.length){
        res.json({error:"User Doesn't Exist please signup first"})
        return;
      } 
      
      bcrypt.compare(password, result[0].password).then(async (match) => {
        if (!match) {
          res.json({ error: "Wrong Username And Password Combination" });
        }else{
          const token = jwt.sign({username:result[0].username, id:result[0].user_id},"jwt")
          //console.log(token)
          res.status(200).json(token);
        }
      });
  });
}

const userContact = async( res, userID) => {
  //console.log(userID);
  connection.query('select user_address.first_name, user_address.last_name, user_address.Unit_number, user_address.addressline_1,user_address.addressline_2, user_address.city, user_address.province, user_address.phone_number, user_signup.email from user_address right join user_signup on user_address.user_id = user_signup.user_id where user_address.user_id=?;',[userID], (err, rows) => {
    if (err) throw err
  
    res.json(rows);
  })
}



module.exports = {userSignup, userLogin, userContact}