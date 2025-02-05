CREATE DATABASE hotel_booking;

USE hotel_booking;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE hotels (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL,
    available_rooms INT NOT NULL
);

CREATE TABLE bookings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    hotel_id INT,
    check_in_date DATE,
    check_out_date DATE,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (hotel_id) REFERENCES hotels(id));

INSERT INTO users (username, password) VALUES
('raj_sharma', 'raj123'), ('priya_verma', 'priya456'), ('aman_gupta', 'aman789'),
('neha_mishra', 'neha321'), ('vikas_yadav', 'vikas654'), ('anita_patel', 'anita987'),
('ravi_kumar', 'ravi123'), ('pallavi_singh', 'pallavi567'), ('suresh_nair', 'suresh789'),
('deepika_mehta', 'deepika234'), ('arjun_rana', 'arjun567'), ('tanya_jain', 'tanya890'),
('rohit_sen', 'rohit111'), ('swati_roy', 'swati222'), ('abhishek_das', 'abhishek333'),
('kiran_chopra', 'kiran444'), ('yash_dubey', 'yash555'), ('megha_kapoor', 'megha666'),
('gopal_varma', 'gopal777'), ('rekha_singh', 'rekha888'), ('anil_bhatt', 'anil999'),
('harsha_rao', 'harsha000'), ('sanjay_pandey', 'sanjay111'), ('preeti_garg', 'preeti222'),
('ritesh_goel', 'ritesh333'), ('manoj_saxena', 'manoj444'), ('chitra_malhotra', 'chitra555'),
('dev_shetty', 'dev666'), ('shruti_rathore', 'shruti777'), ('naveen_iyer', 'naveen888');

INSERT INTO hotels (name, location, available_rooms) VALUES
('Taj Palace', 'New Delhi', 25), ('Oberoi Grand', 'Kolkata', 20), ('Leela Palace', 'Bengaluru', 18),
('Trident', 'Mumbai', 22), ('ITC Maurya', 'New Delhi', 15), ('Radisson Blu', 'Chennai', 17),
('The Lalit', 'Jaipur', 14), ('JW Marriott', 'Pune', 16), ('Novotel', 'Hyderabad', 19),
('The Park', 'Chennai', 21), ('Taj Falaknuma', 'Hyderabad', 13), ('Hyatt Regency', 'Mumbai', 24),
('Westin', 'Gurgaon', 18), ('Four Seasons', 'Mumbai', 12), ('Le Meridien', 'Kochi', 20),
('Fairmont', 'Jaipur', 23), ('Vivanta', 'Goa', 15), ('The Imperial', 'New Delhi', 10),
('Grand Hyatt', 'Kolkata', 22), ('ITC Windsor', 'Bengaluru', 17), ('Holiday Inn', 'Chandigarh', 25),
('Renaissance', 'Mumbai', 11), ('Marriott', 'Bengaluru', 30), ('Claridges', 'New Delhi', 14),
('Jaypee Greens', 'Greater Noida', 19), ('Sheraton', 'Agra', 18), ('Aloft', 'Ahmedabad', 16),
('Hilton', 'Jaipur', 13), ('Shangri-La', 'Bengaluru', 21), ('Courtyard Marriott', 'Chennai', 22);

INSERT INTO bookings (user_id, hotel_id, check_in_date, check_out_date) VALUES
(1, 2, '2025-03-01', '2025-03-05'), (2, 3, '2025-03-10', '2025-03-15'), 
(3, 5, '2025-04-05', '2025-04-10'), (4, 7, '2025-05-12', '2025-05-18'), 
(5, 10, '2025-06-20', '2025-06-25'), (6, 12, '2025-07-05', '2025-07-10'), 
(7, 14, '2025-08-15', '2025-08-20'), (8, 16, '2025-09-01', '2025-09-07'), 
(9, 18, '2025-10-10', '2025-10-15'), (10, 20, '2025-11-05', '2025-11-10'), 
(11, 22, '2025-12-20', '2025-12-25'), (12, 24, '2026-01-05', '2026-01-10'), 
(13, 26, '2026-02-14', '2026-02-20'), (14, 28, '2026-03-01', '2026-03-07'), 
(15, 30, '2026-04-10', '2026-04-15'), (16, 1, '2026-05-05', '2026-05-10'), 
(17, 3, '2026-06-20', '2026-06-25'), (18, 5, '2026-07-10', '2026-07-15'), 
(19, 7, '2026-08-15', '2026-08-20'), (20, 9, '2026-09-01', '2026-09-07'), 
(21, 11, '2026-10-10', '2026-10-15'), (22, 13, '2026-11-05', '2026-11-10'), 
(23, 15, '2026-12-20', '2026-12-25'), (24, 17, '2027-01-05', '2027-01-10'), 
(25, 19, '2027-02-14', '2027-02-20'), (26, 21, '2027-03-01', '2027-03-07'), 
(27, 23, '2027-04-10', '2027-04-15'), (28, 25, '2027-05-05', '2027-05-10'), 
(29, 27, '2027-06-20', '2027-06-25'), (30, 29, '2027-07-10', '2027-07-15');