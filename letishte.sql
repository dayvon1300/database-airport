use airport;
create table flights
(
    flight_id int auto_increment primary key,
    airline varchar(100),
    flight_number varchar(20) unique,
    departure_airport varchar(100),
    arrival_airport varchar(100),
    departure_time datetime,
    arrival_time datetime,
    status enum('Scheduled', 'Delayed', 'Departed', 'Arrived', 'Cancelled') default 'Scheduled'
);

create table passengers
(
passenger_id int auto_increment primary key,
first_name varchar(30),
last_name varchar(30),
nationality varchar(50),
passport_number varchar(30),
date_of_birth date,
gender enum('Male', 'Female')
);
create table employees
(
employee_id int auto_increment primary key,
first_name varchar(30),
last_name varchar(30),
job_title varchar(100),
department varchar(50),
date_of_birth date,
hire_date date,
salary decimal(10,2)
);
create table tickets
(
ticket_id int auto_increment primary key,
passenger_id int,
flight_id int,
seat_number varchar(10),
price decimal(10,2),
flight_status enum('First class', 'Economy', 'Business', 'Premium Economy'),
booking_status enum('Booked', 'Checked in', 'Cancelled') default 'Booked',
foreign key (passenger_id) references passengers(passenger_id),
foreign key (flight_id) references flights(flight_id)
);
create table baggage
(
baggage_id int auto_increment primary key,
passenger_id int,
weight decimal(5,2),
baggage_tag varchar(20),
status enum('Checked in', 'Onboard', 'Lost', 'Delivered') default 'Checked in',
foreign key (passenger_id) references passengers(passenger_id)
);
create table gates
(
gate_id int auto_increment primary key,
gate_number varchar(10) unique,
terminal varchar(10)
);
create table flight_to_gate
(
flight_id int,
gate_id int, 
assignment_time datetime,
primary key (flight_id, gate_id),
foreign key (flight_id) references flights(flight_id),
foreign key (gate_id) references gates(gate_id)
);
alter table flights drop column gate_id;
alter table flights drop foreign key (gate_id) references gates(gate_id);

INSERT INTO flights (airline, flight_number, departure_airport, arrival_airport, gate_id, departure_time, arrival_time, status)
VALUES 
('Turkish Airlines', 'TK101', 'Airport-Sofia', 'Airport-Lichtenstein', '2025-03-15 08:30:00', '2025-03-15 12:00:00', 'Scheduled'),
('Turkish Airlines', 'TK202', 'Airport-Sofia', 'Airport-Atlanta', '2025-03-16 14:00:00', '2025-03-16 22:00:00', 'Scheduled'),
('Turkish Airlines', 'TK303', 'Airport-Sofia', 'Airport-Madrid', '2025-03-17 18:45:00', '2025-03-17 23:55:00', 'Delayed'),
('Lufthansa', 'LH404', 'Airport-Sofia', 'Airport-London', '2025-03-20 10:15:00', '2025-03-20 14:45:00', 'Scheduled'),
('Lufthansa', 'LH505', 'Airport-Sofia', 'Airport-Portugal', '2025-02-07 12:30:00', '2025-02-07 18:20:00', 'Departed'),
('Lufthansa', 'LH606', 'Airport-Sofia', 'Airport-Tokyo', '2025-03-22 23:55:00', '2025-03-23 17:30:00', 'Scheduled'),
('Wizz Air', 'WZ707', 'Airport-Sofia', 'Airport-Stuttgart', '2025-03-25 06:00:00', '2025-03-25 08:30:00', 'Scheduled'),
('Wizz Air', 'WZ808', 'Airport-Sofia', 'Airport-Geneva', '2025-03-26 13:45:00', '2025-03-26 16:10:00', 'Scheduled'),
('Wizz Air', 'WZ909', 'Airport-Sofia', 'Airport-Warsaw', '2025-03-27 20:00:00', '2025-03-27 23:15:00', 'Cancelled'),
('Ryanair', 'FR100', 'Airport-Sofia', 'Airport-Paris', '2025-03-30 07:30:00', '2025-03-30 11:10:00', 'Scheduled'),
('Ryanair', 'FR200', 'Airport-Sofia', 'Airport-Berlin', '2025-03-31 09:50:00', '2025-03-31 12:30:00', 'Departed'),
('Ryanair', 'FR300', 'Airport-Sofia', 'Airport-Rome', '2025-04-01 17:15:00', '2025-04-01 19:40:00', 'Delayed');
