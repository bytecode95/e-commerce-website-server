var connection = require('../db/db-connection')
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');

const adminLogin = async (req, res) => {
  const { username, password } = req.body;
  
    connection.query('select * from admin_signup where username=?;',[req.body.username], (err, result) => {
      //console.log(result);
      //console.log(result.length);
      if(!result.length){
        res.json({error:"User Doesn't Exist"})
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

const adminSignup =async (req, res) => {
  try{
    const hashedPassword = await bcrypt.hash(req.body.password, 10);
    connection.query('insert into admin_signup(first_name, last_name,username, email, password ) values (?, ?, ?, ?, ?)',[req.body.first_name, req.body.last_name, req.body.username, req.body.email, hashedPassword], (err, rows) => {
      if(err) throw err
  
      res.json(rows);
    });

  }catch{
    res.status(500).send();
  }
    

}

const showadminPanel = async (req, res) =>{
  try{
    connection.query('select * from  admin_signup', (err, rows) => {
      if(err) throw err
  
      res.json(rows);
    });

  }catch{
    res.status(500).send();
  }
  

}

module.exports = {adminLogin, adminSignup, showadminPanel}