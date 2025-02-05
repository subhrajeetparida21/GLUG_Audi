const mysql2 = require('mysql2');

const connection = mysql2.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'NITD@2020.',
    database: 'hotel_booking'
});

connection.connect((err) => {
    if (err) throw err;
    console.log('Connected to MySQL Database');
});

module.exports = connection;
