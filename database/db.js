const mysql = require("mysql");

// Create a connection to the database
const connection = mysql.createConnection({
  host: process.env.HOSTDB,
  user: process.env.USERDB,
  password: process.env.PASSDB,
  database: process.env.DB,
  port: parseInt(process.env.PORTDB)
});

// open the MySQL connection
connection.connect(error => {
  if (error) throw error;
  console.log("Successfully connected to the database.");
});

module.exports = connection;