const express = require('express');
const mysql = require('mysql2');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();
app.use(cors());
app.use(bodyParser.json());

// Create a MySQL connection pool (more efficient than single connections)
const pool = mysql.createPool({
  connectionLimit: 10,
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'firstaid'
});

// Endpoint to get a list of articles
app.get('/articles', (req, res) => {
    // Example SQL query, adjust according to your schema
    const query = 'SELECT * FROM articles';
    pool.query(query, (error, results) => {
      if (error) {
        // Handle error appropriately
        res.status(500).json({ error: 'Internal server error' });
      } else {
        // Send JSON response back to the client
        res.json(results);
      }
    });
  });
  

// Start the server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
