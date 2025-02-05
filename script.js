let userId = null;
function login() {
    const username = document.getElementById('username').value;
    const password = document.getElementById('password').value;

    fetch('http://localhost:3000/api/login', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ username, password })
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            userId = data.userId;
            document.getElementById('login-section').style.display = 'none';
            document.getElementById('hotel-check-section').style.display = 'block';
            fetchHotels();
        } else {
            alert('Invalid credentials');
        }
    })
    .catch(error => console.error('Error:', error));
}

function fetchHotels() {
    fetch('http://localhost:3000/api/hotels')
    .then(response => response.json())
    .then(data => {
        const hotelList = document.getElementById('hotel-list');
        const hotelSelect = document.getElementById('hotel-select');
        hotelList.innerHTML = "";
        hotelSelect.innerHTML = "";

        data.forEach(hotel => {
            hotelList.innerHTML += `<li>${hotel.name} - ${hotel.location} (${hotel.available_rooms} rooms)</li>`;
            hotelSelect.innerHTML += `<option value="${hotel.id}">${hotel.name} (${hotel.location})</option>`;
        });
    });
}

function fetchBookings() {
    fetch(`http://localhost:3000/api/bookings/${userId}`)
    .then(response => response.json())
    .then(data => {
        document.getElementById('booking-list').innerHTML = data.map(booking =>
            `<li>${booking.name}, ${booking.location} (From: ${booking.check_in_date} To: ${booking.check_out_date})</li>`
        ).join('');
    });
}

function bookHotel() {
    const hotelId = document.getElementById('hotel-select').value;
    const checkInDate = document.getElementById('check-in').value;
    const checkOutDate = document.getElementById('check-out').value;

    if (!hotelId || !checkInDate || !checkOutDate) {
        alert('Please fill all fields');
        return;
    }

    fetch('http://localhost:3000/api/book', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ userId, hotelId, checkInDate, checkOutDate })
    })
    .then(response => response.json())
    .then(data => {
        alert(data.message);
        fetchBookings();
    })
    .catch(error => console.error('Error:', error));
}
