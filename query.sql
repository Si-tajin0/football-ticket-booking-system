-- Query 1

select match_id, fixture, base_ticket_price::int as base_ticket_price from matches
where tournament_category = 'Champions League' and match_status = 'Available';

-- Query 2

select user_id, full_name, email from users
where full_name ilike 'Tanvir%'
 or full_name ilike '%Haque%';


 -- Query 3

 select booking_id , user_id, match_id , coalesce(payment_status, 'Action Required') as systematic_status from bookings
 where payment_status is null


--Query 4

select booking_id, full_name , fixture, total_cost::int as total_cost from bookings b
inner join users u
on b.user_id = u.user_id

inner join matches m
on b.match_id = m.match_id

--Query 5

select u.user_id, u.full_name, b.booking_id from users u
left join bookings b
on b.user_id = u.user_id


-- Query 6

select booking_id, match_id , total_cost::int as total_cost from bookings
where total_cost > (select avg(total_cost) from bookings);


-- Query 7

select match_id ,fixture, base_ticket_price::int as base_ticket_price from matches
order by base_ticket_price desc
limit 2
offset 1;
