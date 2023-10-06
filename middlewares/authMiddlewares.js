const jwt = require('jsonwebtoken');

function verifyToken(req, res, next) {
  
  const  token  = req.headers["token"];

  if (!token) {
    return res.status(401).json({ message: 'Token is not provided' });
  }
  
  jwt.verify(token, 'jwt', (err, decoded) => {
    if (err) {
      return res.status(401).json({ message: 'Token invalid' });
    }
      req.username = decoded.username;
      req.userid = decoded.id;
      next();  
  });
}

module.exports = { verifyToken  };
