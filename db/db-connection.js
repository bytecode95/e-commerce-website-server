const mysql = require('mysql2');


let connection;

function getConnection(){
    if(!connection){
       connection = mysql.createConnection({
            host: 'localhost',
            user: 'root',
            password: 'Vira@95714',
            database: 'ecommerce_website'
        })
    }
    return connection;
}


module.exports = getConnection();