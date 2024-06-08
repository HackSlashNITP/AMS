const mariadb = require('mariadb');
 //All the fields are provided in ".env-local" file 
const pool = mariadb.createPool({
  host: process.env.DB_HOST, //In my case it is local host
  user: process.env.DB_USER, // Change to your MariaDB username
  password: process.env.DB_PASS, // Change to your MariaDB password
  database: process.env.DB_NAME,
  allowPublicKeyRetrieval:true,
  connectionLimit: 5 // Adjust as needed
});
pool.getConnection()
  .then(conn => {
    console.log('Connected to MariaDB database!');
    conn.release();
  })
  .catch(err => {
    console.error('Error connecting to MariaDB database:', err);
  });

module.exports = pool;