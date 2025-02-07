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
    first_name varchar(50),
    last_name varchar(50),
    passport_number varchar(20) unique,
    nationality varchar(50),
    date_of_birth date,
    gender enum('Male', 'Female', 'Other')
);

create table employees
(
    employee_id int auto_increment primary key,
    first_name varchar(50),
    last_name varchar(50),
    job_title varchar(100),
    department varchar(50),
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
	flight_status enum ('First class', 'Economy', 'Premium Economy', 'Business'),
    booking_status enum('Booked', 'Checked in', 'Cancelled') default 'Booked',
    foreign key (passenger_id) references passengers(passenger_id),
    foreign key (flight_id) references flights(flight_id)
);

create table baggage
(
    baggage_id int auto_increment primary key,
    passenger_id int,
    weight decimal(5,2),
    baggage_tag varchar(20) unique,
    status enum('Checked-in', 'Onboard', 'Lost', 'Delivered') default 'Checked-in',
    foreign key (passenger_id) references passengers(passenger_id)
);

create table gates
(
    gate_id int auto_increment primary key,
    gate_number varchar(10) unique,
    terminal varchar(10)
);

create table flight_gates 
(
    flight_id int,
    gate_id int,
    assignment_time datetime,
    primary key (flight_id, gate_id),
    foreign key (flight_id) references flights(flight_id),
    foreign key (gate_id) references gates(gate_id)
);

insert into passengers (first_name, last_name, nationality, passport_number, date_of_birth, gender) values
('John', 'Doe', 'USA', 'A1234567', '1990-07-12', 'Male'),
('Maria', 'Garcia', 'Spain', 'B2345678', '1985-11-25', 'Female'),
('David', 'Smith', 'UK', 'C3456789', '1978-03-14', 'Male'),
('Emily', 'Johnson', 'Canada', 'D4567890', '1995-06-08', 'Female'),
('Li', 'Wei', 'China', 'E5678901', '1982-09-17', 'Male'),
('Sophia', 'Miller', 'Australia', 'F6789012', '1992-01-22', 'Female'),
('James', 'Brown', 'USA', 'G7890123', '1993-04-19', 'Male'),
('Olivia', 'Martinez', 'Mexico', 'H8901234', '2000-08-30', 'Female'),
('Ethan', 'Wilson', 'Canada', 'I9012345', '1988-12-02', 'Male'),
('Ava', 'Moore', 'USA', 'J0123456', '1997-05-09', 'Female'),
('Lucas', 'Taylor', 'USA', 'K1234567', '1986-02-11', 'Male'),
('Isabella', 'Anderson', 'Brazil', 'L2345678', '1991-10-23', 'Female'),
('Benjamin', 'Thomas', 'UK', 'M3456789', '1983-01-18', 'Male'),
('Charlotte', 'Jackson', 'Canada', 'N4567890', '1994-07-05', 'Female'),
('Henry', 'Harris', 'USA', 'O5678901', '1980-05-30', 'Male'),
('Amelia', 'Clark', 'Australia', 'P6789012', '1996-04-17', 'Female'),
('Alexander', 'Lewis', 'Germany', 'Q7890123', '1992-08-12', 'Male'),
('Zoe', 'Young', 'New Zealand', 'R8901234', '1999-11-21', 'Female'),
('Samuel', 'Walker', 'USA', 'S9012345', '1987-03-02', 'Male'),
('Mia', 'King', 'USA', 'T0123456', '1994-12-15', 'Female'),
('Sophia', 'Smith', 'American', 'A1234567', '1985-03-12', 'Female'),
('Jackson', 'Johnson', 'Canadian', 'C2345678', '1992-06-25', 'Male'),
('Olivia', 'Williams', 'British', 'B3456789', '1988-11-19', 'Female'),
('Liam', 'Brown', 'Australian', 'A4567890', '1991-08-30', 'Male'),
('Isabella', 'Jones', 'American', 'J5678901', '1994-01-03', 'Female'),
('James', 'Garcia', 'Mexican', 'G6789012', '1987-05-14', 'Male'),
('Amelia', 'Martinez', 'Spanish', 'M7890123', '1990-07-21', 'Female'),
('Benjamin', 'Hernandez', 'American', 'H8901234', '1984-02-09', 'Male'),
('Ella', 'Lopez', 'French', 'L9012345', '1996-12-04', 'Female'),
('Lucas', 'Gonzalez', 'Brazilian', 'G1234567', '1992-04-17', 'Male'),
('Charlotte', 'Perez', 'Italian', 'P2345678', '1989-09-22', 'Female'),
('Henry', 'Wilson', 'Canadian', 'W3456789', '1993-05-10', 'Male'),
('Grace', 'Taylor', 'American', 'T4567890', '1995-03-27', 'Female'),
('Aiden', 'Moore', 'American', 'M5678901', '1987-08-11', 'Male'),
('Evelyn', 'Jackson', 'Canadian', 'J6789012', '1991-12-01', 'Female'),
('Nathan', 'Lee', 'South Korean', 'L7890123', '1990-10-04', 'Male'),
('Zoe', 'Walker', 'British', 'W8901234', '1994-06-15', 'Female'),
('Matthew', 'Hall', 'American', 'H9012345', '1986-11-29', 'Male'),
('Mia', 'Allen', 'Australian', 'A1234567', '1992-09-03', 'Female'),
('Ethan', 'Young', 'American', 'Y2345678', '1989-04-18', 'Male'),
('Ivan', 'Petrov', 'Bulgaria', 'BG1234567', '1985-03-12', 'Male'),
('Maria', 'Ivanova', 'Bulgaria', 'BG7654321', '1992-07-25', 'Female'),
('John', 'Smith', 'USA', 'US9876543', '1988-11-04', 'Male'),
('Emily', 'Johnson', 'Canada', 'CA6549873', '1995-06-17', 'Female'),
('Ahmed', 'Khan', 'Pakistan', 'PK1122334', '1980-09-09', 'Male'),
('Sophie', 'Dubois', 'France', 'FR9988776', '1993-05-22', 'Female'),
('Carlos', 'Gomez', 'Spain', 'ES5544332', '1990-12-30', 'Male'),
('Elena', 'Morales', 'Mexico', 'MX6677889', '1997-02-14', 'Female'),
('Liam', 'O Connor', 'Ireland', 'IR3344556', '1982-08-08', 'Male'),
('Hiroshi', 'Tanaka', 'Japan', 'JP1122445', '1994-03-03', 'Male'),
('Anna', 'Kuznetsova', 'Russia', 'RU5566778', '1989-10-21', 'Female'),
('Fatima', 'Al-Farsi', 'UAE', 'AE9988221', '1996-12-05', 'Female'),
('David', 'Andersen', 'Denmark', 'DK8899001', '1987-04-18', 'Male'),
('Chen', 'Wei', 'China', 'CN6677885', '1991-07-07', 'Male'),
('Olga', 'Nowak', 'Poland', 'PL4455667', '1998-09-15', 'Female'),
('Mohammed', 'Ali', 'Egypt', 'EG2233445', '1983-11-23', 'Male'),
('Jessica', 'Brown', 'Australia', 'AU7788991', '1999-05-29', 'Female'),
('Stefan', 'Müller', 'Germany', 'DE3322114', '1986-02-10', 'Male'),
('Paula', 'Rodriguez', 'Argentina', 'AR6655443', '1993-01-26', 'Female'),
('Victor', 'Lungu', 'Romania', 'RO9988772', '1990-06-11', 'Male'),
('Lucas', 'Martin', 'Brazil', 'BR1234567', '1987-04-15', 'Male'),
('Isabella', 'Rossi', 'Italy', 'IT7654321', '1990-08-22', 'Female'),
('Ethan', 'Clark', 'Australia', 'AU2345678', '1985-12-05', 'Male'),
('Chloe', 'Dubois', 'France', 'FR8765432', '1992-03-18', 'Female'),
('Noah', 'Schmidt', 'Germany', 'DE3456789', '1989-07-30', 'Male'),
('Mia', 'Garcia', 'Spain', 'ES9876543', '1994-11-12', 'Female'),
('Alexander', 'Ivanov', 'Russia', 'RU4567890', '1986-01-25', 'Male'),
('Sophia', 'Kowalski', 'Poland', 'PL6789012', '1991-06-14', 'Female'),
('Liam', 'Murphy', 'Ireland', 'IE5678901', '1988-09-09', 'Male'),
('Emma', 'Johansson', 'Sweden', 'SE7890123', '1993-02-27', 'Female'),
('Benjamin', 'Kim', 'South Korea', 'KR8901234', '1987-05-19', 'Male'),
('Olivia', 'Nakamura', 'Japan', 'JP9012345', '1990-10-03', 'Female'),
('Daniel', 'Smith', 'United Kingdom', 'GB0123456', '1985-11-21', 'Male'),
('Ava', 'Lee', 'Singapore', 'SG1234567', '1992-04-08', 'Female'),
('Matthew', 'Brown', 'Canada', 'CA2345678', '1989-08-16', 'Male'),
('Emily', 'Wilson', 'New Zealand', 'NZ3456789', '1994-12-29', 'Female'),
('James', 'Nguyen', 'Vietnam', 'VN4567890', '1986-03-11', 'Male'),
('Grace', 'Chen', 'China', 'CN5678901', '1991-07-23', 'Female'),
('Henry', 'Meier', 'Switzerland', 'CH6789012', '1988-02-14', 'Male'),
('Sofia', 'Silva', 'Portugal', 'PT7890123', '1993-06-07', 'Female'),
('Oliver', 'Thompson', 'USA', 'P11223344', '1987-05-16', 'Male'),
('Emma', 'Rodriguez', 'Spain', 'X99887766', '1993-08-22', 'Female'),
('Yusuf', 'Khan', 'Pakistan', 'PK87654321', '1990-02-11', 'Male'),
('Camille', 'Lefevre', 'France', 'F76543210', '1995-07-04', 'Female'),
('Ronan', 'Murphy', 'Ireland', 'IR65432109', '1984-06-19', 'Male'),
('Takumi', 'Fujimoto', 'Japan', 'JP54321098', '1991-09-29', 'Male'),
('Nadia', 'Ivanova', 'Russia', 'RU43210123', '1986-03-15', 'Female'),
('Ethan', 'Williams', 'Canada', 'C32109877', '1994-12-09', 'Male'),
('Zainab', 'Al-Salem', 'UAE', 'UAE21098764', '1989-11-30', 'Female'),
('George', 'Baker', 'UK', 'UK10987653', '1981-04-25', 'Male'),
('Giovanni', 'Marchetti', 'Italy', 'I99887744', '1997-01-18', 'Male'),
('Matthias', 'Becker', 'Germany', 'G88776643', '1983-10-03', 'Male'),
('Li', 'Xiaoming', 'China', 'CH77665532', '1996-05-14', 'Male'),
('Fatou', 'Diop', 'Senegal', 'S66554422', '1992-07-07', 'Female'),
('Bruno', 'Silva', 'Brazil', 'BR55443311', '1985-09-20', 'Male'),
('Jasmine', 'Vermeer', 'Netherlands', 'NL44332210', '1998-08-05', 'Female'),
('Diego', 'Ramirez', 'Mexico', 'M33221199', '1982-12-28', 'Male'),
('Charlotte', 'Davies', 'Australia', 'A22110088', '1999-06-16', 'Female'),
('Khaled', 'Hussein', 'Egypt', 'EG11009977', '1980-03-09', 'Male'),
('Freja', 'Svensson', 'Sweden', 'S00998866', '1995-11-02', 'Female');

insert into tickets (passenger_id, flight_id, seat_number, price, flight_status, booking_status) values
(1, 21, 'D3', 600.00, 'Premium Economy', 'Booked'),
(2, 4, 'A1', 500.00, 'Business', 'Booked'),
(3, 5, 'B2', 350.00, 'Economy', 'Booked'),
(4, 6, 'C3', 600.00, 'First class', 'Checked in'),
(5, 7, 'D4', 450.00, 'Economy', 'Booked'),
(6, 8, 'E5', 550.00, 'Premium Economy', 'Booked'),
(7, 9, 'F6', 400.00, 'Business', 'Cancelled'),
(8, 10, 'G7', 300.00, 'Economy', 'Booked'),
(9, 11, 'H8', 650.00, 'First class', 'Booked'),
(10, 12, 'I9', 700.00, 'Business', 'Checked in'),
(11, 13, 'J10', 450.00, 'Economy', 'Booked'),
(12, 14, 'K11', 600.00, 'Premium Economy', 'Cancelled'),
(13, 15, 'L12', 550.00, 'Business', 'Booked'),
(14, 16, 'M13', 350.00, 'Economy', 'Checked in'),
(15, 17, 'N14', 500.00, 'Premium Economy', 'Booked'),
(16, 18, 'O15', 600.00, 'First class', 'Booked'),
(17, 19, 'P16', 450.00, 'Economy', 'Booked'),
(18, 20, 'Q17', 550.00, 'Business', 'Checked in'),
(19, 21, 'R18', 700.00, 'First class', 'Booked'),
(20, 22, 'S19', 400.00, 'Economy', 'Cancelled'),
(21, 23, 'T20', 600.00, 'Premium Economy', 'Booked'),
(22, 24, 'A7', 500.00, 'Business', 'Booked'),
(23, 25, 'B19', 350.00, 'Economy', 'Booked'),
(24, 26, 'C25', 600.00, 'First class', 'Checked in'),
(25, 27, 'D12', 450.00, 'Economy', 'Booked'),
(26, 20, 'E4', 550.00, 'Premium Economy', 'Booked'),
(27, 21, 'F29', 400.00, 'Business', 'Cancelled'),
(28, 9, 'G16', 300.00, 'Economy', 'Booked'),
(29, 12, 'H2', 650.00, 'First class', 'Booked'),
(30, 16, 'I22', 700.00, 'Business', 'Checked in'),
(31, 14, 'J13', 450.00, 'Economy', 'Booked'),
(32, 5, 'K21', 600.00, 'Premium Economy', 'Cancelled'),
(33, 26, 'L10', 550.00, 'Business', 'Booked'),
(34, 24, 'M23', 350.00, 'Economy', 'Checked in'),
(35, 7, 'N14', 500.00, 'Premium Economy', 'Booked'),
(36, 6, 'O30', 600.00, 'First class', 'Booked'),
(37, 11, 'P17', 450.00, 'Economy', 'Booked'),
(38, 13, 'Q5', 550.00, 'Business', 'Checked in'),
(39, 22, 'R27', 700.00, 'First class', 'Booked'),
(40, 6, 'S6', 400.00, 'Economy', 'Cancelled'),
(41, 5, '12B', 250.00, 'Economy', 'Booked'),
(42, 8, '7C', 320.50, 'Business', 'Checked in'),
(43, 12, '18A', 450.75, 'First class', 'Booked'),
(44, 6, '22F', 180.00, 'Economy', 'Cancelled'),
(45, 9, '5E', 275.20, 'Premium Economy', 'Checked in'),
(46, 14, '19D', 490.00, 'First class', 'Booked'),
(47, 7, '3A', 310.75, 'Business', 'Checked in'),
(48, 11, '14C', 210.50, 'Economy', 'Booked'),
(49, 20, '21B', 230.00, 'Premium Economy', 'Cancelled'),
(50, 18, '6F', 260.00, 'Economy', 'Checked in'),
(51, 15, '8D', 360.80, 'Business', 'Booked'),
(52, 22, '10E', 280.25, 'Premium Economy', 'Checked in'),
(53, 25, '13A', 410.50, 'First class', 'Booked'),
(54, 17, '17C', 195.75, 'Economy', 'Cancelled'),
(55, 21, '4B', 220.90, 'Economy', 'Checked in'),
(56, 19, '23D', 500.00, 'First class', 'Booked'),
(57, 10, '15E', 305.50, 'Business', 'Checked in'),
(58, 16, '9A', 255.75, 'Premium Economy', 'Booked'),
(59, 13, '20C', 375.00, 'Business', 'Cancelled'),
(60, 24, '2F', 275.60, 'Economy', 'Checked in'),
(61, 12, '12A', 500.00, 'First class', 'Booked'),
(62, 25, '7C', 200.50, 'Economy', 'Checked in'),
(63, 9, '19F', 320.75, 'Business', 'Booked'),
(64, 18, '5B', 150.00, 'Economy', 'Cancelled'),
(65, 23, '22D', 275.25, 'Premium Economy', 'Booked'),
(66, 15, '14E', 450.00, 'First class', 'Checked in'),
(67, 7, '8A', 290.30, 'Business', 'Booked'),
(68, 26, '10C', 310.90, 'Economy', 'Cancelled'),
(69, 4, '1A', 700.00, 'First class', 'Checked in'),
(70, 14, '17B', 270.50, 'Premium Economy', 'Booked'),
(71, 11, '3F', 190.75, 'Economy', 'Checked in'),
(72, 21, '16D', 230.00, 'Business', 'Cancelled'),
(73, 6, '21E', 185.50, 'Economy', 'Booked'),
(74, 9, '9A', 295.20, 'Premium Economy', 'Checked in'),
(75, 24, '2C', 600.00, 'First class', 'Booked'),
(76, 13, '4B', 165.75, 'Economy', 'Cancelled'),
(77, 22, '20A', 215.00, 'Business', 'Booked'),
(78, 17, '6D', 350.90, 'Premium Economy', 'Checked in'),
(79, 5, '11E', 285.30, 'Economy', 'Booked'),
(80, 27, '15C', 200.50, 'Business', 'Cancelled'),
(81, 8, '23A', 275.80, 'Premium Economy', 'Booked'),
(82, 20, '13B', 180.00, 'Economy', 'Checked in'),
(83, 10, '24C', 320.25, 'Business', 'Cancelled'),
(84, 16, '18F', 150.75, 'Economy', 'Booked'),
(85, 14, '25D', 275.60, 'Premium Economy', 'Checked in'),
(86, 19, '26E', 200.20, 'Business', 'Booked'),
(87, 7, '27A', 290.90, 'Economy', 'Cancelled'),
(88, 4, '28C', 310.50, 'First class', 'Checked in'),
(89, 22, '29B', 500.75, 'Business', 'Booked'),
(90, 12, '30F', 270.10, 'Premium Economy', 'Cancelled'),
(91, 21, '31D', 190.30, 'Economy', 'Checked in'),
(92, 25, '32E', 230.80, 'Business', 'Booked'),
(93, 6, '33A', 185.00, 'Economy', 'Cancelled'),
(94, 9, '34B', 295.60, 'First class', 'Checked in'),
(95, 18, '35C', 450.40, 'Business', 'Booked'),
(96, 27, '36D', 165.90, 'Economy', 'Checked in'),
(97, 24, '37E', 215.30, 'Premium Economy', 'Cancelled'),
(98, 16, '38A', 350.80, 'Business', 'Booked'),
(99, 13, '39B', 285.10, 'Economy', 'Checked in'),
(100, 5, '40C', 200.90, 'First class', 'Booked');


insert into gates (gate_number, terminal) values
('A1', 'T1'),
('B2', 'T2'),
('C3', 'T1'),
('D4', 'T3'),
('E5', 'T2'),
('F6', 'T1'),
('G7', 'T3'),
('H8', 'T2');

insert into baggage (passenger_id, weight, baggage_tag, status) values
(1, 23.5, 'BAGG1A', 'Checked in'),
(2, 18.2, 'BAGG2B', 'Onboard'),
(3, 15.8, 'BAGG3C', 'Lost'),
(4, 12.3, 'BAGG4D', 'Checked in'),
(5, 20.1, 'BAGG5E', 'Delivered'),
(6, 22.0, 'BAGG6F', 'Checked in'),
(7, 25.3, 'BAGG7G', 'Onboard'),
(8, 19.5, 'BAGG8H', 'Lost'),
(9, 10.2, 'BAGG9I', 'Checked in'),
(10, 17.0, 'BAGG10J', 'Delivered'),
(11, 23.7, 'BAGG11K', 'Onboard'),
(12, 14.4, 'BAGG12L', 'Lost'),
(13, 21.3, 'BAGG13M', 'Checked in'),
(14, 16.8, 'BAGG14N', 'Delivered'),
(15, 18.7, 'BAGG15O', 'Onboard'),
(16, 22.5, 'BAGG16P', 'Checked in'),
(17, 19.0, 'BAGG17Q', 'Lost'),
(18, 24.2, 'BAGG18R', 'Delivered'),
(19, 20.4, 'BAGG19S', 'Checked in'),
(20, 15.0, 'BAGG20T', 'Onboard'),
(21, 19.4, 'BAGG21A', 'Checked in'),
(22, 25.1, 'BAGG22B', 'Onboard'),
(23, 13.7, 'BAGG23C', 'Lost'),
(24, 22.3, 'BAGG24D', 'Checked in'),
(25, 18.5, 'BAGG25E', 'Delivered'),
(26, 21.2, 'BAGG26F', 'Checked in'),
(27, 24.6, 'BAGG27G', 'Onboard'),
(28, 16.8, 'BAGG28H', 'Lost'),
(29, 11.3, 'BAGG29I', 'Checked in'),
(30, 14.6, 'BAGG30J', 'Delivered'),
(31, 23.0, 'BAGG31K', 'Onboard'),
(32, 20.2, 'BAGG32L', 'Lost'),
(33, 17.3, 'BAGG33M', 'Checked in'),
(34, 20.7, 'BAGG34N', 'Delivered'),
(35, 22.8, 'BAGG35O', 'Onboard'),
(36, 26.0, 'BAGG36P', 'Checked in'),
(37, 19.2, 'BAGG37Q', 'Lost'),
(38, 24.0, 'BAGG38R', 'Delivered'),
(39, 27.3, 'BAGG39S', 'Checked in'),
(40, 12.5, 'BAGG40T', 'Onboard'),
(41, 18.5, 'BAGG41A', 'Checked in'),
(42, 22.3, 'BAGG42B', 'Onboard'),
(43, 19.7, 'BAGG43C', 'Lost'),
(44, 21.4, 'BAGG44D', 'Delivered'),
(45, 20.0, 'BAGG45E', 'Checked in'),
(46, 23.1, 'BAGG46F', 'Onboard'),
(47, 17.8, 'BAGG47G', 'Lost'),
(48, 24.5, 'BAGG48H', 'Delivered'),
(49, 18.9, 'BAGG49I', 'Checked in'),
(50, 22.7, 'BAGG50J', 'Onboard'),
(51, 19.3, 'BAGG51K', 'Lost'),
(52, 21.6, 'BAGG52L', 'Delivered'),
(53, 20.2, 'BAGG53M', 'Checked in'),
(54, 23.4, 'BAGG54N', 'Onboard'),
(55, 18.1, 'BAGG55O', 'Lost'),
(56, 24.0, 'BAGG56P', 'Delivered'),
(57, 19.6, 'BAGG57Q', 'Checked in'),
(58, 22.9, 'BAGG58R', 'Onboard'),
(59, 20.5, 'BAGG59S', 'Lost'),
(60, 21.8, 'BAGG60T', 'Delivered'),
(61, 18.5, 'BAGG61A', 'Checked in'),
(62, 21.2, 'BAGG62B', 'Onboard'),
(63, 19.8, 'BAGG63C', 'Lost'),
(64, 22.0, 'BAGG64D', 'Delivered'),
(65, 20.1, 'BAGG65E', 'Checked in'),
(66, 23.3, 'BAGG66F', 'Onboard'),
(67, 17.7, 'BAGG67G', 'Lost'),
(68, 24.5, 'BAGG68H', 'Delivered'),
(69, 18.9, 'BAGG69I', 'Checked in'),
(70, 21.6, 'BAGG70J', 'Onboard'),
(71, 19.3, 'BAGG71K', 'Lost'),
(72, 22.7, 'BAGG72L', 'Delivered'),
(73, 20.0, 'BAGG73M', 'Checked in'),
(74, 23.5, 'BAGG74N', 'Onboard'),
(75, 18.2, 'BAGG75O', 'Lost'),
(76, 21.8, 'BAGG76P', 'Delivered'),
(77, 19.4, 'BAGG77Q', 'Checked in'),
(78, 22.9, 'BAGG78R', 'Onboard'),
(79, 20.5, 'BAGG79S', 'Lost'),
(80, 23.0, 'BAGG80T', 'Delivered'),
(81, 18.3, 'BAGG81U', 'Checked in'),
(82, 21.1, 'BAGG82V', 'Onboard'),
(83, 19.6, 'BAGG83W', 'Lost'),
(84, 22.2, 'BAGG84X', 'Delivered'),
(85, 20.8, 'BAGG85Y', 'Checked in'),
(86, 23.7, 'BAGG86Z', 'Onboard'),
(87, 18.7, 'BAGG87A', 'Lost'),
(88, 21.4, 'BAGG88B', 'Delivered'),
(89, 19.9, 'BAGG89C', 'Checked in'),
(90, 22.4, 'BAGG90D', 'Onboard'),
(91, 20.3, 'BAGG91E', 'Lost'),
(92, 23.8, 'BAGG92F', 'Delivered'),
(93, 18.4, 'BAGG93G', 'Checked in'),
(94, 21.0, 'BAGG94H', 'Onboard'),
(95, 19.2, 'BAGG95I', 'Lost'),
(96, 22.6, 'BAGG96J', 'Delivered'),
(97, 20.9, 'BAGG97K', 'Checked in'),
(98, 23.1, 'BAGG98L', 'Onboard'),
(99, 18.6, 'BAGG99M', 'Lost'),
(100, 21.5, 'BAGG100N', 'Delivered');

insert into flight_to_gate (flight_id, gate_id, assignment_time) values
(4, 1, '2025-03-15 08:30:00'),
(5, 2, '2025-03-16 14:00:00'),
(6, 3, '2025-03-17 18:45:00'),
(7, 4, '2025-03-20 10:15:00'),
(8, 5, '2025-02-07 12:30:00'),
(9, 6, '2025-03-22 23:55:00'),
(10, 7, '2025-03-25 06:00:00'),
(11, 8, '2025-03-26 13:45:00'),
(12, 1, '2025-03-27 20:00:00'),
(13, 2, '2025-03-30 07:30:00'),
(14, 3, '2025-03-31 09:50:00'),
(15, 4, '2025-04-01 17:15:00'),
(16, 5, '2025-03-13 09:30:00'),
(17, 6, '2025-03-16 20:00:00'),
(18, 7, '2025-03-17 21:55:00'),
(19, 8, '2025-03-20 14:45:00'),
(20, 1, '2025-02-07 22:20:00'),
(21, 2, '2025-03-23 12:30:00'),
(22, 3, '2025-03-25 09:00:00'),
(23, 4, '2025-03-26 15:10:00'),
(24, 5, '2025-03-27 21:30:00'),
(25, 6, '2025-03-30 11:30:00'),
(26, 7, '2025-03-31 13:15:00'),
(27, 8, '2025-04-01 19:40:00');

insert into flights (airline, flight_number, departure_airport, arrival_airport, departure_time, arrival_time, status)
values 
('Turkish Airlines', 'TK101', 'Airport-Sofia', 'Airport-Lichtenstein', '2025-03-15 08:30:00', '2025-03-15 12:00:00', 'Scheduled'),
('Turkish Airlines', 'TK202', 'Airport-Sofia', 'Airport-Atlanta', '2025-03-16 14:00:00', '2025-03-16 22:00:00', 'Scheduled'),
('Turkish Airlines', 'TK303', 'Airport-Sofia', 'Airport-Madrid', '2025-03-17 18:45:00', '2025-03-17 23:55:00', 'Delayed'),
('Lufthansa', 'LH404', 'Airport-Sofia', 'Airport-London', '2025-03-20 10:15:00', '2025-03-20 14:45:00', 'Scheduled'),
('Lufthansa', 'LH505', 'Airport-Sofia', 'Airport-Portugal', '2025-03-21 12:30:00', '2025-03-21 18:20:00', 'Departed'),
('Lufthansa', 'LH606', 'Airport-Sofia', 'Airport-Tokyo', '2025-03-22 23:55:00', '2025-03-23 17:30:00', 'Scheduled'),
('Wizz Air', 'WZ707', 'Airport-Sofia', 'Airport-Stuttgart', '2025-03-25 06:00:00', '2025-03-25 08:30:00', 'Scheduled'),
('Wizz Air', 'WZ808', 'Airport-Sofia', 'Airport-Geneva', '2025-03-26 13:45:00', '2025-03-26 16:10:00', 'Scheduled'),
('Wizz Air', 'WZ909', 'Airport-Sofia', 'Airport-Warsaw', '2025-03-27 20:00:00', '2025-03-27 23:15:00', 'Cancelled'),
('Ryanair', 'FR100', 'Airport-Sofia', 'Airport-Paris', '2025-03-30 07:30:00', '2025-03-30 11:10:00', 'Scheduled'),
('Ryanair', 'FR200', 'Airport-Sofia', 'Airport-Berlin', '2025-03-31 09:50:00', '2025-03-31 12:30:00', 'Departed'),
('Ryanair', 'FR300', 'Airport-Sofia', 'Airport-Rome', '2025-04-01 17:15:00', '2025-04-01 19:40:00', 'Delayed'),
('Turkish Airlines', 'TK102', 'Airport-Bucharest', 'Airport-Sofia', '2025-03-15 08:30:00', '2025-03-15 12:00:00', 'Scheduled'),
('Turkish Airlines', 'TK203', 'Airport-Oslo', 'Airport-Sofia', '2025-03-16 14:00:00', '2025-03-16 22:00:00', 'Scheduled'),
('Turkish Airlines', 'TK304', 'Airport-Marseille', 'Airport-Sofia', '2025-03-17 18:45:00', '2025-03-17 23:55:00', 'Delayed'),
('Lufthansa', 'LH405', 'Airport-Munich', 'Airport-Sofia', '2025-03-20 10:15:00', '2025-03-20 14:45:00', 'Scheduled'),
('Lufthansa', 'LH506', 'Airport-New-York', 'Airport-Sofia', '2025-03-21 12:30:00', '2025-03-21 18:20:00', 'Departed'),
('Lufthansa', 'LH607', 'Airport-Ottawa', 'Airport-Sofia', '2025-03-22 23:55:00', '2025-03-23 17:30:00', 'Scheduled'),
('Wizz Air', 'WZ708', 'Airport-Copenhagen', 'Airport-Sofia', '2025-03-25 06:00:00', '2025-03-25 08:30:00', 'Scheduled'),
('Wizz Air', 'WZ809', 'Airport-Budapest', 'Airport-Sofia', '2025-03-26 13:45:00', '2025-03-26 16:10:00', 'Scheduled'),
('Wizz Air', 'WZ910', 'Airport-Prague', 'Airport-Sofia', '2025-03-27 20:00:00', '2025-03-27 23:15:00', 'Cancelled'),
('Ryanair', 'FR101', 'Airport-London', 'Airport-Sofia', '2025-03-30 07:30:00', '2025-03-30 11:10:00', 'Scheduled'),
('Ryanair', 'FR201', 'Airport-Dublin', 'Airport-Sofia', '2025-03-31 09:50:00', '2025-03-31 12:30:00', 'Departed'),
('Ryanair', 'FR301', 'Airport-Venice', 'Airport-Sofia', '2025-04-01 17:15:00', '2025-04-01 19:40:00', 'Delayed');

insert into Employees (first_name, last_name, job_title, department, date_of_birth, hire_date, salary) values
('Michael', 'Johnson', 'Pilot', 'Flight Operations', '1983-02-25', '2010-06-01', 90000.00),
('Sarah', 'Williams', 'Flight Attendant', 'Passenger Services', '1990-07-13', '2015-09-17', 35000.00),
('David', 'Brown', 'Ground Crew', 'Ground Operations', '1985-11-30', '2012-03-21', 28000.00),
('Emily', 'Davis', 'Customer Service Representative', 'Customer Relations', '1994-01-12', '2019-08-15', 42000.00),
('James', 'Miller', 'Air Traffic Controller', 'Air Traffic Control', '1979-06-22', '2003-05-10', 75000.00),
('Sophia', 'Garcia', 'Maintenance Technician', 'Maintenance', '1988-03-30', '2014-11-06', 55000.00),
('Lucas', 'Martinez', 'Ticketing Agent', 'Sales & Ticketing', '1991-09-19', '2017-05-02', 32000.00),
('Lily', 'Rodriguez', 'Security Officer', 'Security', '1984-12-05', '2010-02-14', 45000.00),
('Matthew', 'Hernandez', 'Chef', 'In-Flight Services', '1992-04-08', '2018-06-20', 38000.00),
('Olivia', 'Young', 'Human Resources Manager', 'Human Resources', '1986-11-14', '2016-04-22', 70000.00),
('Ethan', 'Lee', 'Flight Dispatcher', 'Flight Operations', '1987-02-11', '2013-08-27', 60000.00),
('Zoe', 'Walker', 'Customer Support Specialist', 'Customer Relations', '1995-10-02', '2020-11-10', 35000.00),
('Daniel', 'Allen', 'Ramp Agent', 'Ground Operations', '1993-01-27', '2016-02-25', 28000.00),
('Mia', 'Scott', 'Baggage Handler', 'Ground Operations', '1990-08-14', '2012-09-18', 25000.00),
('Alexander', 'King', 'Logistics Coordinator', 'Logistics', '1984-06-05', '2011-03-07', 62000.00),
('Charlotte', 'Adams', 'Flight Attendant', 'Passenger Services', '1994-09-11', '2019-02-14', 37000.00),
('Benjamin', 'Nelson', 'Ground Crew Supervisor', 'Ground Operations', '1982-07-22', '2006-10-01', 48000.00),
('Amelia', 'Carter', 'Assistant Manager', 'Sales & Ticketing', '1987-05-18', '2014-01-12', 55000.00),
('William', 'Perez', 'Aircraft Mechanic', 'Maintenance', '1990-12-03', '2014-06-17', 65000.00),
('Ella', 'Roberts', 'Cleaning Staff', 'Ground Operations', '1996-02-25', '2021-04-01', 23000.00);

select * from passengers;

select count(*) as total_passengers from passengers;

select * from employees where department = 'Security';

select p.first_name, p.last_name, b.baggage_tag 
from passengers as p
join baggage as b on p.passenger_id = b.passenger_id
where b.status = 'Lost';

select t.ticket_id, t.flight_id, t.seat_number, t.price 
from tickets as t
join passengers as p on t.passenger_id = p.passenger_id
where p.first_name = 'John' and p.last_name = 'Doe';

select g.gate_number, f.flight_id, f.flight_number 
from gates as g
join flight_to_gate as fg on g.gate_id = fg.gate_id
join flights as f on fg.flight_id = f.flight_id;

select f.flight_number, g.gate_number, fg.assignment_time 
from flights as f
join flight_to_gate fg on f.flight_id = fg.flight_id
join gates g on fg.gate_id = g.gate_id;

select p.first_name, p.last_name, t.seat_number, t.price
from passengers as p
join tickets as t on p.passenger_id = t.passenger_id
where t.flight_status = 'Economy';

select p.first_name, p.last_name, SUM(b.weight) as total_weight
from passengers as p
join baggage as b on p.passenger_id = b.passenger_id
group by p.passenger_id;

select flight_id, COUNT(*) as checked_in_passengers
from tickets
where booking_status = 'Checked in'
group by flight_id
having COUNT(*) > 1
order by checked_in_passengers desc;

select t.ticket_id, p.first_name, p.last_name, t.booking_status
from tickets as t
join passengers as p on t.passenger_id = p.passenger_id
where t.booking_status = 'Booked';

select gate_number from gates where terminal = 'T1';

select flight_id, count(*) as cancelled_tickets
from tickets
where booking_status = 'Cancelled'
group by flight_id
order by cancelled_tickets desc;

select ticket_id, passenger_id, flight_id, seat_number, price, booking_status
from tickets
where flight_status = 'First class' and booking_status = 'Booked';

select flight_id, SUM(price) as total_revenue
from tickets
where booking_status in ('Booked', 'Checked in')
group by flight_id
order by total_revenue desc;