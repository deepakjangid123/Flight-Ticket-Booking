create table customer
(
username varchar(30) not null,
password varchar(20) not null,
first_name varchar(20) not null,
last_name varchar(20) not null,
contact_no int,
credit_card_no int not null,
address varchar(250),
gender varchar(1) CHECK (gender='M' or gender='F'),
primary key(username)
);

create table flight_info
(
flight_id varchar(30) not null,
source varchar(30) not null,
destination varchar(30) not null,
departure_time TIME,
departure_day varchar(10) not null,
arrival_time TIME,
arrival_day varchar(10) not null,
total_seats int,
primary key(flight_id)
);

create table seats
(
flight_id varchar(30) not null,
flight_class varchar(20) not null default 'economy',
available_seats int not null,
foreign key(flight_id) references flight_info(flight_id) on delete cascade
);

create table ticket
(
username varchar(30) not null,
booking_id varchar(30) not null,
flight_id varchar(30) not null,
amount double not null,
primary key(booking_id),
foreign key(username) references customer(username),
foreign key(flight_id) references flight_info(flight_id)
);