const createDBConnection = require('../db/dbConnection')



const userAddress = async (res, userID,userDetails) => {
  const sql = 'insert into user_address (first_name, last_name, unit_number, addressline_1, addressline_2, phone_number,city,zip, province, user_id ) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);'
  const params = [userDetails.first_name, userDetails.last_name,userDetails.unit_number, userDetails.addressline_1, userDetails.addressline_2, userDetails.phone_number, userDetails.city, userDetails.zip, userDetails.province, userID]
   try{
    const connection = await createDBConnection();
    const [result] = await connection.execute(sql, params);
    
    //console.log('User contact information updated successfully');
    res.status(200).json({ message: 'Contact information updated successfully' });
    return result;
   } 
   catch (err) {
    throw err;
   }
}

const getuserInformation = async (res, userID) => {
  const sql = 'select * from user_address where user_id = ?';
  const params = [userID !== undefined ? userID : null]; // Pass user ID as a parameter
  console.log(params)
  try {
    const connection = await createDBConnection();
    const [result] = await connection.execute(sql, params);
    //console.log(result);
    res.json(result);
    connection.end(); // Close the database connection
    return result; 
  } catch (err) {
    console.error('Error:', err);
    
  }
};

module.exports = {userAddress, getuserInformation };