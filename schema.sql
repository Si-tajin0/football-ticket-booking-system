--  Create a Users table

create table users (
  user_id int primary key,
  full_name varchar(100) not null,
  email varchar(100) unique not null,
  role varchar(20) check (role in('Ticket Manager', 'Football Fan')) not null,
  phone_number varchar(50)
)



-- Create a Matches Table

create table matches (
  match_id int primary key,
  fixture varchar (150) not null,
  tournament_category varchar(50) not null,
  base_ticket_price numeric(10,2) not null,
  match_status varchar(20) check (match_status in('Available', 'Selling Fast', 'Sold Out', 'Postponed')) not null
)


-- Create a Bookings Table

create table bookings(
  booking_id int primary key,
  user_id int references users(user_id),
  match_id int references matches(match_id),
  seat_number varchar(50),
  payment_status varchar(50) check (payment_status in('Pending','Confirmed','Cancelled','Refunded')),
  total_cost numeric(10,2) not null
)
