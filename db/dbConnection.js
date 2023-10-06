const mysqlpromise = require('mysql2/promise');



async function createDBConnection() {
    try {
      const connection = await mysqlpromise.createConnection({
        host: 'localhost',
        user: 'root',
        password: 'Vira@95714',
        database: 'ecommerce_website',
      });
      return connection;
    } catch (err) {
      throw err;
    }
  }

  module.exports = createDBConnection;