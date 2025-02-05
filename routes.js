const express = require('express');
const router = express.Router();
const connection = require('./db');

// User Login
router.post('/login', (req, res) => {
    const { username, password } = req.body;
    connection.query(
        'SELECT * FROM users WHERE username = ? AND password = ?',
        [username, password],
        (err, results) => {
            if (err) throw err;
            if (results.length > 0) {
                res.json({ success: true, userId: results[0].id });
            } else {
                res.status(401).json({ success: false, message: 'Invalid credentials' });
            }
        }
    );
});

// Fetch Hotel Availability
router.get('/hotels', (req, res) => {
    connection.query('SELECT * FROM hotels', (err, results) => {
        if (err) throw err;
        res.json(results);
    });
});

// Fetch User's Bookings
router.get('/bookings/:userId', (req, res) => {
    const userId = req.params.userId;
    connection.query(
        `SELECT hotels.name, hotels.location, bookings.check_in_date, bookings.check_out_date 
         FROM bookings 
         JOIN hotels ON bookings.hotel_id = hotels.id 
         WHERE bookings.user_id = ?`,
        [userId],
        (err, results) => {
            if (err) throw err;
            res.json(results);
        }
    );
});

// Book a Hotel
router.post('/book', (req, res) => {
    const { userId, hotelId, checkInDate, checkOutDate } = req.body;

    connection.query(
        'INSERT INTO bookings (user_id, hotel_id, check_in_date, check_out_date) VALUES (?, ?, ?, ?)',
        [userId, hotelId, checkInDate, checkOutDate],
        (err) => {
            if (err) {
                res.status(500).json({ message: 'Booking failed' });
            } else {
                res.json({ message: 'Booking successful!' });
            }
        }
    );
});

module.exports = router;
