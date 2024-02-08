-- Bluebikes 2018 Exploration

select * 
from bluebikes_2018 
limit 10; 

-- Count of subscribers for Bluebikes 2018 - 1,436,677

select count(*)
from bluebikes_2018
where user_type ilike 'Subscriber'; 

-- Count of non subscribers for Bluebikes 2018 - 331,129

select count(*)
from bluebikes_2018
where user_type ilike 'Customer';

-- Subscribers by user gender: 0 - 11,187; 1 - 1,066,437; 2 - 359,053;

select user_gender, count(*)
from bluebikes_2018 
where user_type ilike 'Subscriber'
group by user_gender

-- Customers by user gender: 0 - 216,490; 1 - 75,298; 2 - 39,341;

select user_gender, count(*)
from bluebikes_2018
where user_type ilike 'Customer'
group by user_gender

-- List of top 10 start station with the count of each user type 
select s.name, count(b18.user_type)
from bluebikes_2018 as b18
join bluebikes_stations as s
on b18.start_station_id = s.id
group by s.name 
order by count(b18.user_type) desc
limit 10; 


-- List of top 10 end station with the count of each user type 
select s.name, count(b18.user_type)
from bluebikes_2018 as b18
join bluebikes_stations as s
on b18.end_station_id = s.id
group by s.name 
order by count(b18.user_type) desc
limit 10; 

-- Most starting station for subscribers 

select s.name, count(b18.bike_id), s.latitude, s.longitude
from bluebikes_2018 as b18
join bluebikes_stations as s 
on b18.start_station_id = s.id 
where user_type like 'Subscriber'
group by s.name, s.latitude, s.longitude 
order by count(b18.bike_id) desc
limit 10; 

-- Most ending station for subscribers 

select s.name, count(b18.bike_id), s.latitude, s.longitude
from bluebikes_2018 as b18
join bluebikes_stations as s 
on b18.end_station_id = s.id 
where user_type like 'Subscriber'
group by s.name, s.latitude, s.longitude 
order by count(b18.bike_id) desc
limit 10; 

-- Most starting station for customers 

select s.name, count(b18.bike_id), s.latitude, s.longitude
from bluebikes_2018 as b18
join bluebikes_stations as s 
on b18.start_station_id = s.id 
where user_type like 'Customer'
group by s.name, s.latitude, s.longitude 
order by count(b18.bike_id) desc
limit 10; 

-- Most ending station for customers 

select s.name, count(b18.bike_id), s.latitude, s.longitude
from bluebikes_2018 as b18
join bluebikes_stations as s 
on b18.end_station_id = s.id 
where user_type like 'Customer'
group by s.name, s.latitude, s.longitude 
order by count(b18.bike_id) desc
limit 10; 
